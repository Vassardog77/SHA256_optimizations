module UARTmod_2_ECM_tb();

	logic vrn_ovr_flw_flg, blk_fnd_flg_out, new_data_in,reward_found;
	logic [31:0] vrsn_out, tme_out, non_out, non_out_1;
	logic[639:0] blk_hdr=640'b0, blk_hdr_1=640'b0;

	logic system_clk, clk, rstn, rx_pin, tx_pin, ecm_clk_en=1'b0, ecm_clk, hold_4_pc=1'b0,frcd_loop_exit=1'b0;
	logic[31:0] blk_hdr_data [19:0];
	logic [31:0] header0 [19:0];
	
	logic [2:0] core_addr;
    logic [31:0] nonce_data;
    logic [31:0] time_data;
    logic [31:0] version_data;
	
	
	logic [7:0] count = 0;
	logic [7:0] buff [0:3];
	int ixh, ixl;
	
	logic [7:0] cmd = 8'b00000000;
	
	
	function [9:0] pac(input [7:0] a);
		begin
			pac = {1'b1,a,1'b0};
		end
	endfunction
	

	assign new_data_in = ({blk_hdr_data[0],blk_hdr_data[1],blk_hdr_data[2],blk_hdr_data[3],blk_hdr_data[4],blk_hdr_data[5],
						   blk_hdr_data[6],blk_hdr_data[7],blk_hdr_data[8],blk_hdr_data[9],blk_hdr_data[10],blk_hdr_data[11],
						   blk_hdr_data[12],blk_hdr_data[13],blk_hdr_data[14],blk_hdr_data[15],blk_hdr_data[16],blk_hdr_data[17],
						   blk_hdr_data[18],blk_hdr_data[19]}==blk_hdr_1)?1'b0:1'b1;
	assign ecm_clk = ecm_clk_en && system_clk;
	
	

	UART uart_inst_0 (.system_clk_pin(system_clk), .rstn_pin(rstn), .rx_pin(rx_pin), .tx_pin(tx_pin),.reward_found(reward_found),
						.nonce_data(nonce_data),.time_data(time_data),.version_data(version_data), .blk_hdr(blk_hdr_data),.hold_val(hold_4_pc) );
						
	ECM inst_0(ecm_clk, blk_hdr_1, vrn_ovr_flw_flg, blk_fnd_flg_out, vrsn_out, tme_out, non_out );


	always @(posedge new_data_in) begin
		blk_hdr_1={blk_hdr_data[0],blk_hdr_data[1],blk_hdr_data[2],blk_hdr_data[3],blk_hdr_data[4],blk_hdr_data[5],
				 blk_hdr_data[6],blk_hdr_data[7],blk_hdr_data[8],blk_hdr_data[9],blk_hdr_data[10],blk_hdr_data[11],
				 blk_hdr_data[12],blk_hdr_data[13],blk_hdr_data[14],blk_hdr_data[15],blk_hdr_data[16],blk_hdr_data[17],
				 blk_hdr_data[18],blk_hdr_data[19]};
		ecm_clk_en=1'b1;
				 
		$display("data chunk 1 = %h" , { blk_hdr_1[639:608], blk_hdr_1[607:576], blk_hdr_1[575:544], blk_hdr_1[543:512],
										  blk_hdr_1[511:480], blk_hdr_1[479:448], blk_hdr_1[447:416], blk_hdr_1[415:384],
										  blk_hdr_1[383:352], blk_hdr_1[351:320], blk_hdr_1[319:288], blk_hdr_1[287:256],
										  blk_hdr_1[255:224], blk_hdr_1[223:192], blk_hdr_1[191:160], blk_hdr_1[159:128]} );
										  
		$display("data chunk 2 = %h" , { blk_hdr_1[127:96], blk_hdr_1[95:64], blk_hdr_1[63:32], blk_hdr_1[31:0],
										  32'h80000000, 32'h00000000, 32'h00000000, 32'h00000000,
										  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000280 } );
		$display("");
	end
	
	always @(non_out) begin
		non_out_1=non_out;
		nonce_data = non_out;
		time_data = 32'b0;
		version_data = 32'b0;
		reward_found = 1'b0;
		core_addr = 1;
	end
	
	always @(blk_fnd_flg_out) begin
		if (blk_hdr_1!=640'b0)begin
			core_addr = 1;
			
			nonce_data = non_out;
			time_data = tme_out;
			version_data = vrsn_out;
			reward_found = blk_fnd_flg_out;
			
			$display("");
			$display("******** ECM sending found block data to pc via uart res-mod ********");
			$display("Jumping out of mining loop and continuing to toggle clock for uart");
			$display("");
		end
	end

	initial begin
		blk_hdr_data ='{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
						32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
						32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
						


		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011948750833;
		blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011945750833; // 41750833 <<---- nonce as been adjusted so nonce = nonce_blk_fnd - 8 (meaning 7 nonce+1 then blk_fnd)
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01193B750833; // <<---- nonce as been adjusted so nonce = nonce_blk_fnd - 13 (meaning 12 nonce+1 then blk_fnd)
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553 525F01193B750833; //<<---- messed up time stamp used for other testing
		//
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011900000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011901000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011902000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011903000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011904000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011905000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011906000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011907000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011908000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011909000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190A000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190B000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190C000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190D000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190E000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190F000000;
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011910000000;

						
		header0='{blk_hdr[639:608], blk_hdr[607:576], blk_hdr[575:544], blk_hdr[543:512],
				  blk_hdr[511:480], blk_hdr[479:448], blk_hdr[447:416], blk_hdr[415:384],
				  blk_hdr[383:352], blk_hdr[351:320], blk_hdr[319:288], blk_hdr[287:256],
				  blk_hdr[255:224], blk_hdr[223:192], blk_hdr[191:160], blk_hdr[159:128],
				  blk_hdr[127:96], blk_hdr[95:64], blk_hdr[63:32], blk_hdr[31:0]};
				  
		rx_pin = 1; system_clk = 0; rstn = 1; #5;
		rstn = 0; #5;
		system_clk = 1; #5;
		rstn = 1; #5;
		system_clk = 0; #5;
		
		count = 0;
						
		vrn_ovr_flw_flg=1'b0;
		blk_fnd_flg_out=1'b0;
		vrsn_out=32'h00000000;
		tme_out=32'h00000000;
		non_out=32'h00000000;
		
		// Send Command Byte
		for(int k=0; k<10; k=k+1) begin
			rx_pin <= pac(cmd)[k];
			for(int j=0; j<87; j=j+1) begin
				system_clk = 1; #1;
				system_clk = 0; #1;
			end
		end
		

		//  Send Data (80 bytes)
		if(cmd < 8'h8) begin
			for(int i=19; i>-1; i=i-1) begin
				buff[0] <= header0[i][31:24];
				buff[1] <= header0[i][23:16];
				buff[2] <= header0[i][15:8];
				buff[3] <= header0[i][7:0];
				for(int j=0; j<4; j = j+1) begin
					for(int k=0; k<10; k=k+1) begin
						rx_pin <= pac(buff[j])[k];
						for(int m=0; m<87; m=m+1) begin
							system_clk = 1; #1;
							system_clk = 0; #1;
						end
					end
				end
			end
		end	

		while (blk_fnd_flg_out==1'b0)begin
			if(32'h4A750833 >= non_out_1) begin
				system_clk <= 0; #1;
				system_clk <= 1; #1;
			end else begin
				blk_fnd_flg_out=1'b1;
				$display("");
				$display("");
				$display("---->>>>>--------***********---------<<<<<---");
				$display("Forced Exiting of while loop" );
				$display("---->>>>>--------***********---------<<<<<---");
				$display("");
				system_clk=1'b0; #10000000;
			end
		end
		count = 0;
		while(hold_4_pc==1'b1&&frcd_loop_exit==1'b0)begin
			$display("");
			$display("---->>>>>--------***********---------<<<<<---");
			$display("hold_4_pc: %b | frcd_loop_exit: %b | Waiting for UART res-mod to release hold",hold_4_pc,frcd_loop_exit);
			$display("---->>>>>--------***********---------<<<<<---");
			if (30 >= count) begin
				system_clk <= 0; #1;
				system_clk <= 1; #1;
				count = count+1;
			end else frcd_loop_exit=1'b1;
		end
		$display("");
		$display("---->>>>>--------***********---------<<<<<---");
		$display("hold_4_pc: %b | frcd_loop_exit: %b | Jumped out of hold while loop and about to exit initial block",hold_4_pc,frcd_loop_exit);
		$display("---->>>>>--------***********---------<<<<<---");
		$display("");
	end
	
endmodule