// UART Response Interface
// Sends responses over UART transmitter
// Nickolas Grillone

module uart_rsp_if(
input logic sys_clk,
input logic rstn,
output logic tx_pin,
input logic busy,
input logic err,
input logic ack, // Important signals ECM start after this
input logic reward_found,
input logic nonce_overflow,
output logic hold_val,
input logic valid,
input logic [2:0] core_addr,
input logic [31:0] nonce_data,
input logic [31:0] time_data,
input logic [31:0] version_data);

// -----------------------
// 		UART RX Setup
// -----------------------

// Clock frequency in hertz.
parameter CLK_HZ = 50000000;
parameter BIT_RATE =   576000;
parameter PAYLOAD_BITS = 8;

// Signals (wires) for UART_TX <- Interface
logic [7:0]  uart_tx_data;
logic        tx_start;
logic        tx_busy;

uart_tx #(
	.BIT_RATE(BIT_RATE),
	.PAYLOAD_BITS(PAYLOAD_BITS),
	.CLK_HZ  (CLK_HZ  )
	) i_uart_tx(
	.clk          (sys_clk     ),
	.resetn       (rstn        ),
	.uart_txd     (tx_pin      ),
	.uart_tx_en   (tx_start),
	.uart_tx_busy (tx_busy     ),
	.uart_tx_data (uart_tx_data));

// FSM States
parameter FSM_IDLE = 0;
parameter FSM_DECOD = 1;
parameter FSM_SEND = 2;
parameter FSM_NOP = 3;
parameter FSM_WAIT = 4;

// Current and next states
logic [2:0] fsm_state = FSM_IDLE;
logic [2:0] n_fsm_state = FSM_IDLE;

logic interrupt;
logic [3:0] int_reg;
logic [2:0] core_reg;
logic [7:0] uart_buf [0:12];
logic [7:0] n_uart_tx_data;
logic n_hold_val;
logic [3:0] byte_cntr = 0;
logic [3:0] n_byte_cntr;
logic incl_data;

logic clk;
logic clk_latch = 1;
assign clk = sys_clk & clk_latch;

assign interrupt = err || ack || nonce_overflow || reward_found;
assign n_byte_cntr = byte_cntr + 1;

always_comb begin
    case (fsm_state)
        FSM_IDLE: begin
            n_uart_tx_data <= 0;
            if(interrupt) begin
                n_fsm_state <= FSM_DECOD;
                n_hold_val <= 1;
            end
			else begin
                n_fsm_state <= FSM_IDLE;
                n_hold_val <= 0;
            end
            tx_start <= 0;
        end
        FSM_DECOD: begin
            if(valid) begin
                n_fsm_state <= FSM_SEND;
                n_hold_val <= 0;
            end
            else begin
                n_fsm_state <= FSM_DECOD;
                n_hold_val <= 1;
            end
            tx_start <= 0;
        end
        FSM_SEND: begin
            n_uart_tx_data <= uart_buf[byte_cntr];
            n_hold_val <= 0;
            n_fsm_state <= FSM_NOP;
            tx_start <= 0;
        end
        FSM_NOP: begin
            tx_start <= 1;
            n_fsm_state <= FSM_WAIT;
        end
        FSM_WAIT: begin
            if(tx_busy) begin 
                n_fsm_state <= FSM_WAIT;
                tx_start <= 1;
            end
            else begin
                tx_start <= 0;
                if(incl_data) begin
                    n_fsm_state <= FSM_SEND;
                end
                else begin
                    n_fsm_state <= FSM_IDLE;
                end
            end
        end
        default: begin
            n_fsm_state <= FSM_IDLE;
        end
    endcase
end

always @ * begin
    if(~rstn) clk_latch <= 1;
    else if (fsm_state == FSM_IDLE & interrupt == 0) clk_latch <= 0;
    else if (fsm_state == FSM_WAIT && tx_busy) clk_latch <= 0;
    else clk_latch <= 1;
end

always_ff @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
        fsm_state <= 0;
        int_reg <= 0;
        hold_val <= 0;
        incl_data = 0;
        uart_tx_data <= 0;
        core_reg <= 0;
    end
    else begin

        fsm_state <= n_fsm_state;
        hold_val <= n_hold_val;

        if(fsm_state == FSM_IDLE) begin
            int_reg <= {err, ack, nonce_overflow, reward_found};
            core_reg <= core_addr;
        end

        else if(fsm_state == FSM_DECOD) begin
            casez (int_reg)
                4'b???1: begin // reward found
					uart_buf[0] <= {5'h00,core_reg};
                end
                4'b??1?: begin // nonce overflow
					uart_buf[0] <= 8'hA;
                end
                4'b?1??: begin // ack
                    uart_buf[0] <= 8'h8;
                end
                4'b1???: begin // error
                    uart_buf[0] <= 8'h9;
                end
            endcase

            if (int_reg[0] | int_reg[1]) incl_data = 1;
            else incl_data = 0;

            uart_buf[1] <= nonce_data[7:0];
			uart_buf[2] <= nonce_data[15:8];
			uart_buf[3] <= nonce_data[23:16];
			uart_buf[4] <= nonce_data[31:24];
			uart_buf[5] <= time_data[7:0];
			uart_buf[6] <= time_data[15:8];
			uart_buf[7] <= time_data[23:16];
			uart_buf[8] <= time_data[31:24];
			uart_buf[9] <= version_data[7:0];
			uart_buf[10] <= version_data[15:8];
			uart_buf[11] <= version_data[23:16];
			uart_buf[12] <= version_data[31:24];

        end

        else if (fsm_state == FSM_SEND) begin
            uart_tx_data <= n_uart_tx_data;
        end
        else if (fsm_state == FSM_WAIT) begin
            if(incl_data && ~tx_busy) byte_cntr <= n_byte_cntr;
            if(byte_cntr == 12) begin
                byte_cntr <= 0;
                incl_data <= 0;
            end
        end
    end
end

endmodule