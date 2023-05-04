// UART Command Interface
// Processes commands from UART Receiver
// Nickolas Grillone

module uart_cmd_if(
input logic sys_clk,
input logic rstn,
input logic rx_pin,
output logic busy,
output logic err,
output logic ack,
output logic get_nonce, // Important signals ECM start after this
output logic header_latch, // optional latch-in data command
output logic inc_time, // increment time
output logic wr_en, // write enable to block header registers (halt engine)
output logic [7:0] addr, // address of block header register (*see note below*)
output logic [31:0] data);

/*
	**Note: The addressing is setup to allow any case of Hash Engine design:
	
	- Header Payload: The block header is directly loaded to the Hash Engine.
		The block header is represented by 20x32-bit values, representing the
		full block header minus padding. Address 0x00 is the right-most value.
		
	- Midstate Payload: Similar to above but the 16 least significant values
		are the midstate. (same operation)
		
	- Multicore Payload (ASICBoost): Adressing is similar to above for an
		individual midstate register but the 3 MSB represent the core.
		Ex: 0x62 = [011][01010] = [3][10] --> Core #3, Section 10 (from right)
*/

	// -----------------------
	// 		UART RX Setup
	// -----------------------

	// Clock frequency in hertz.
	parameter CLK_HZ = 50000000;
	parameter BIT_RATE =   576000;
	parameter PAYLOAD_BITS = 8;

	// Signals (wires) for UART_RX -> Interface
	logic [7:0]  uart_rx_data;
	logic        uart_rx_valid;
	logic        uart_rx_break;

	// UART RX module instance
	uart_rx #(
	.BIT_RATE(BIT_RATE),
	.PAYLOAD_BITS(PAYLOAD_BITS),
	.CLK_HZ  (CLK_HZ  )
	) i_uart_rx(
	.clk          (sys_clk      ), // Top level system clock input.
	.resetn       (rstn         ), // Asynchronous active low reset.
	.uart_rxd     (rx_pin     ), // UART Recieve pin.
	.uart_rx_en   (1'b1         ), // Recieve enable
	.uart_rx_break(uart_rx_break), // Did we get a BREAK message?
	.uart_rx_valid(uart_rx_valid), // Valid data recieved and available.
	.uart_rx_data (uart_rx_data )  // The recieved data.
	);

	// -----------------------
	// 	Command Paramaters
	// -----------------------

	localparam CMD_WRMSN = 8'b00000???;
	localparam CMD_LATCH = 8'h8;
	localparam CMD_GETNCE = 8'h9;

	// -----------------------
	// 		Stored Values
	// -----------------------

	logic [31:0] uart_buf [0:19];
	logic [7:0] dword_buf [0:3];
	logic [2:0] core_sel = 0;
	logic [1:0] dword_cntr = 0;
	logic [4:0] buf_cntr = 0;
	localparam BUF_CNTR_MAX = 20;
	
	logic dqo_latch = 0;
	logic delay_lock;
	logic delay_rst;

	// Next values (wires) for stored values
	logic [2:0] n_core_sel = 0;
	logic [1:0] n_dword_cntr = 0;
	logic [4:0] n_buf_cntr = 0;
	logic n_dqo_latch;

	// -----------------------
	// 		FSM Values
	// -----------------------

	// FSM States
	localparam FSM_IDLE = 0;
	localparam FSM_CMD = 1;
	localparam FSM_DQI = 2;
	localparam FSM_DQO = 3;
	localparam FSM_ACK = 4;
	localparam FSM_ERR = 5;

	// Current and next states
	logic [2:0] fsm_state = FSM_IDLE;
	logic [2:0] n_fsm_state = FSM_IDLE;

	always_comb begin
		// Finite State Machine (FSM) Switch-Case
		case(fsm_state)
			// Idle State
			FSM_IDLE: begin
				ack <= 0;
				err <= 0;
				busy <= 0;
				get_nonce <= 0;
				header_latch <=0;
				inc_time <= 0;
				n_dqo_latch <=0;
				//wr_en <= 0;
				if(uart_rx_valid) n_fsm_state = FSM_CMD;
				else n_fsm_state = FSM_IDLE;
			end
			// Command Lookup State
			FSM_CMD: begin
				// Switch-case for all commands
				casez(uart_rx_data)
					CMD_WRMSN: begin
						header_latch <= 0;
						get_nonce <= 0;
						n_dqo_latch <= 1;
						n_core_sel <= uart_rx_data[2:0];
						n_fsm_state <= FSM_DQI;
					end
					CMD_LATCH: begin
						header_latch <= 1;
						get_nonce <= 0;
						n_core_sel <= 0;
						n_fsm_state <= FSM_ACK;
					end
					CMD_GETNCE: begin
						header_latch <= 0;
						get_nonce <= 1;
						n_core_sel <= 0;
						n_fsm_state <= FSM_ACK;
					end
					8'b????????: begin
						n_fsm_state <= FSM_ERR;
					end
				endcase
				end
			// Data Input State (get data from PC)
			FSM_DQI: begin
				if(buf_cntr == BUF_CNTR_MAX) begin
					n_buf_cntr <= 0;
					n_fsm_state <= FSM_DQO;
					n_dqo_latch <= 1;
				end
				else begin
					n_buf_cntr <= buf_cntr + 1;
				end
				n_dword_cntr <= dword_cntr + 1;
			end
			// Data Output State (send data to Hash Engine)
			FSM_DQO: begin
				if(buf_cntr == BUF_CNTR_MAX-1 & !dqo_latch) begin
					n_buf_cntr <= 0;
					n_fsm_state <= FSM_ACK;
				end
				else begin
					n_buf_cntr <= buf_cntr + 1;
					n_dqo_latch <= 0;
				end
			end
			// Acknowledge State
			FSM_ACK: begin
				ack <= 1;
				n_fsm_state <= FSM_IDLE;
				end
			// Error State
			FSM_ERR: begin
				err <= 1;
				n_fsm_state <= FSM_IDLE;
				end
			// Default State
			default: n_fsm_state = FSM_IDLE;
		endcase
	end
	
	always_ff @ (posedge uart_rx_valid or posedge delay_rst or negedge rstn) begin
		if(delay_rst | ~rstn) delay_lock <= 0;
		else delay_lock <= 1;
	end

	always_ff @ (posedge sys_clk or negedge rstn) begin
		if(!rstn) begin
			fsm_state <= FSM_IDLE;
			core_sel <= 0;
			dword_cntr <= 0;
			buf_cntr <= 0;
			delay_rst <= 0;
			wr_en <= 0;
			addr <= 0;
			data <= 0;
			dqo_latch <= 0;
		end
		else begin
			fsm_state <= n_fsm_state;
			dqo_latch <= n_dqo_latch;
			if(!delay_lock & delay_rst) delay_rst <= 0;
			if (fsm_state == FSM_CMD) begin
				core_sel <= n_core_sel;
				delay_rst <= 1;
			end
			else if(fsm_state == FSM_DQI & delay_lock) begin
				dword_buf[dword_cntr] = uart_rx_data;
				if(dword_cntr == 3) begin 
					uart_buf[buf_cntr] = {dword_buf[0],dword_buf[1],dword_buf[2],dword_buf[3]};
					buf_cntr <= n_buf_cntr;
				end
				dword_cntr <= n_dword_cntr;
				delay_rst <= 1;
			end
			else if(fsm_state == FSM_DQO) begin
				if (dqo_latch) begin
					buf_cntr <= 5'h00;
				end
				else begin
					wr_en <= 1;
					data <= uart_buf[buf_cntr];
					addr <= {core_sel,buf_cntr};
					buf_cntr <= n_buf_cntr;
				end
			end
			else if (fsm_state == FSM_ACK) begin
				wr_en <= 0;
				data <= 0;
				addr <= 0;
			end
		end
	end
endmodule