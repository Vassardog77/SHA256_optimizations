module UART (input logic system_clk_pin, rstn_pin, rx_pin, tx_pin, reward_found,
			 input logic [31:0] nonce_data,time_data, version_data,
			 output logic[31:0] blk_hdr [19:0], output logic hold_val);

	logic clk, 
		  rstn,
//		  rx_pin,
//		  tx_pin,
		  busy,
		  err,
		  ack,
		  _reward_found,
		  nonce_overflow,
		  _hold_val,
		  _valid,
		  wr_en,
		  get_nonce,
		  header_latch,
		  inc_time,
		  clk_en,
		  new_data_inbnd_clk,
		  inbnd_data_cmpltd_clk,
		  inbnd_data_trns_cmpltd;
		  
	logic [2:0] clk_cntr = 3'b0;
	logic [7:0] addr;
	logic [31:0] data;
    logic [2:0] core_addr;
    logic [31:0] _nonce_data;
    logic [31:0] _time_data;
    logic [31:0] _version_data;
	logic [31:0] _blk_hdr [19:0] ='{32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,
									 32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,
									 32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,
									 32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000};
									 
	assign clk = clk_en && system_clk_pin;
	assign hold_val =_hold_val;
	assign new_data_inbnd_clk = clk && wr_en && ((inbnd_data_trns_cmpltd==1'b0)?1'b1:1'b0);//((clk==1'b1 && wr_en==1'b1 && inbnd_data_trns_cmpltd==1'b0)?1'b1:1'b0); 
//	assign inbnd_data_cmpltd_clk = clk && wr_en && inbnd_data_trns_cmpltd; 
	

	uart_cmd_if uart_cmd_if_inst0 (
	.sys_clk		(clk),
	.rstn			(rstn_pin),
	.rx_pin			(rx_pin),
	.busy			(busy),
	.err			(err),
	.ack			(ack),
	.get_nonce		(get_nonce),
	.header_latch	(header_latch),
	.inc_time		(inc_time), 
	.wr_en			(wr_en),
	.addr			(addr),
	.data			(data));
	

    

    uart_rsp_if uart_rsp_if_inst0(
    .sys_clk        (clk),
    .rstn           (rstn_pin),
    .tx_pin         (tx_pin),
    .busy           (busy),
    .err            (err),
    .ack            (ack),  
    .reward_found   (_reward_found),
    .nonce_overflow (nonce_overflow),
    .hold_val       (_hold_val),
    .valid          (_valid),
    .core_addr      (core_addr),
    .nonce_data     (_nonce_data),
    .time_data      (_time_data),
    .version_data   (_version_data));
	
	
	
	
	
	always @(posedge clk) begin
//		if(rstn==1'b1 && clk_cntr==3'b010)begin
//			rstn<=1'b0;
//			clk_cntr<=3'b0;
//		end
//		else if(rstn==1'b1) clk_cntr=clk_cntr+1'b1;
//		
		if(inbnd_data_trns_cmpltd==1'b1 && wr_en==1'b0)inbnd_data_trns_cmpltd=1'b0;
	end
	
	always @(negedge rstn_pin)begin
		rstn<=1'b1;
//		inbnd_data_cmpltd_clk <=1'b0;
		inbnd_data_trns_cmpltd <=1'b0;
		clk_en<=1'b1;
		clk_cntr = 3'b0;
		_blk_hdr = '{32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,
					32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,
					32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,
					32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000};
	end
	
	always @(posedge rstn_pin) rstn<=1'b0;
	
	always @(negedge new_data_inbnd_clk)begin
		if(rstn==1'b0)begin
			if (addr==5'h0)begin
				$display("");
				$display("---->>>>>--------****** UART cmd-mod data - Log Start ******---------<<<<<---");
				$display("");
			end

			_blk_hdr[addr]=data;
			$display("_blk_hdr[%d]: %h  | data: %h ",addr, _blk_hdr[addr],data);

			if (addr==5'h13)begin
				inbnd_data_trns_cmpltd<=1'b1;			
				blk_hdr = _blk_hdr;
				$display("");
				$display("");
				$display("blk_hdr: %h",{blk_hdr[0], blk_hdr[1], blk_hdr[2], blk_hdr[3],blk_hdr[4], blk_hdr[5], blk_hdr[6], blk_hdr[7],
										blk_hdr[8], blk_hdr[9], blk_hdr[10], blk_hdr[11],blk_hdr[12], blk_hdr[13], blk_hdr[14], blk_hdr[15],
										blk_hdr[16], blk_hdr[17], blk_hdr[18], blk_hdr[19]});
				$display("");
				$display("---->>>>>--------****** UART cmd-mod data - Log End ******---------<<<<<---");
				$display("");
			
			end
		end
	end	
	
	always @(posedge get_nonce)begin
		_valid = 1'b1;
		_nonce_data = nonce_data;
		_time_data = time_data;
		_version_data = version_data;	
		
		$display("");
		$display("---->>>>>--------****** UART res-mod data - Log Start ******---------<<<<<---");
		$display("");
		$display("Sending the following to PC for get_nonce request");
		$display("       reward_found: %d  |  nonce_data: %h  |  time_data: %h  |  version_data: %h",
						_reward_found, _nonce_data,_time_data,_version_data);
	end
	
	always @(posedge reward_found)begin
		_reward_found = 1'b1;
		_valid = 1'b1;
		_nonce_data = nonce_data;
		_time_data = time_data;
		_version_data = version_data;
		
		$display("");
		$display("---->>>>>--------****** UART res-mod data - Log Start ******---------<<<<<---");
		$display("");
		$display("Sending the following to PC");
		$display("       reward_found: %d  |  nonce_data: %h  |  time_data: %h  |  version_data: %h",
						_reward_found, _nonce_data,_time_data,_version_data);

	end
	
	always @(negedge _hold_val)begin
		if(rstn==1'b0)begin
			_reward_found = 1'b0;
			_valid = 1'b0;
			_nonce_data = 32'b0;
			_time_data = 32'b0;
			_version_data = 32'b0;
		
			$display("");
			$display("hold bit was released | hold_val: %b",_hold_val);
			$display("");
			$display("block data is in the hands of UART");
			$display("");
			$display("---->>>>>--------****** UART res-mod data - Log End ******---------<<<<<---");
		end
	end

	
	
	
endmodule