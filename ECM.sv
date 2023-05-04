module ECM (input logic system_clk, logic[639:0] blk_hdr, output logic vrn_ovr_flw_flg, blk_fnd_flg_out, output logic [31:0] vrsn_out, tme_out, non_out );

	logic [31:0] data0 [0:15]; //= {  blk_hdr[639:608], blk_hdr[607:576], blk_hdr[575:544], blk_hdr[543:512],
								//	blk_hdr[511:480], blk_hdr[479:448], blk_hdr[447:416], blk_hdr[415:384],
								//	blk_hdr[383:352], blk_hdr[351:320], blk_hdr[319:288], blk_hdr[287:256],
								//	blk_hdr[255:224], blk_hdr[223:192], blk_hdr[191:160], blk_hdr[159:128]};

	logic [31:0] data1 [0:15] ;//= { blk_hdr[127:96], blk_hdr[95:64], blk_hdr[63:32], blk_hdr[31:0],
								//	32'h80000000, 32'h00000000, 32'h00000000, 32'h00000000,
								//	32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
								//	32'h00000000, 32'h00000000, 32'h00000000, 32'h00000280 };
	logic [31:0] blk_hdr_data [0:19] = '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
	logic [31:0] iv[0:7] = '{32'h6a09e667, 32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
	
	logic [31:0] kt [0:63] = '{32'h428A2F98,32'h71374491,32'hB5C0FBCF,32'hE9B5DBA5,32'h3956C25B,32'h59F111F1,32'h923F82A4,32'hAB1C5ED5,32'hD807AA98,
	32'h12835B01,32'h243185BE,32'h550C7DC3,32'h72BE5D74,32'h80DEB1FE,32'h9BDC06A7,32'hC19BF174,32'hE49B69C1,32'hEFBE4786,32'h0FC19DC6,32'h240CA1CC,
	32'h2DE92C6F,32'h4A7484AA,32'h5CB0A9DC,32'h76F988DA,32'h983E5152,32'hA831C66D,32'hB00327C8,32'hBF597FC7,32'hC6E00BF3,32'hD5A79147,32'h06CA6351,
	32'h14292967,32'h27B70A85,32'h2E1B2138,32'h4D2C6DFC,32'h53380D13,32'h650A7354,32'h766A0ABB,32'h81C2C92E,32'h92722C85,32'hA2BFE8A1,32'hA81A664B,
	32'hC24B8B70,32'hC76C51A3,32'hD192E819,32'hD6990624,32'hF40E3585,32'h106AA070,32'h19A4C116,32'h1E376C08,32'h2748774C,32'h34B0BCB5,32'h391C0CB3,
	32'h4ED8AA4A,32'h5B9CCA4F,32'h682E6FF3,32'h748F82EE,32'h78A5636F,32'h84C87814,32'h8CC70208,32'h90BEFFFA,32'hA4506CEB,32'hBEF9A3F7,32'hC67178F2};

	
	logic rst=1'b0,
		  core_rst=1'b0,
		  clk=1'b0,
		  clk_en=1'b0,
		  cntr_en=1'b0,
		  sec_tick=1'b0,
		  tme_flg=1'b0,
		  validOut_0=1'b0,
		  validOut_1=1'b0,
		  validOut_2=1'b0,
		  vrn_cir_complt_flg=1'b0,
		  inc_vrn_flg=1'b0,
		  inc_vrn_flg_=1'b0,
		  core_en=1'b0,
		  vrsn_en_clk=1'b0,
		  vrsn_en=1'b0,
		  ms_0_en = 1'b0,
		  ms_1_en = 1'b0,
		  ms_2_en = 1'b0,
		  iniztn_cmpltd_clk,
		  vrsn_updt_clk,
		  calc_ms_clk,
		  core_en_clk,		  
		  chk_core_otpts,
		  vrsn_inc_clk,
		  new_data_in;
	
	logic [2:0] blk_fnd = 2'b00;
	logic [5:0] r_cntr = 6'b000000;

	logic [31:0] cr_tme = 32'h00000000,
				 crnt_nonce = 32'h00000000,
				 vrsn2 = 32'h00000000,
				 vrsn1 = 32'h00000000,
				 vrsn0 = 32'h00000000,
				 vrsn =  32'h00000000,
				 nxt_vrsn,
				 shdw_vrsn = 32'h00000000,
				 tme = 32'h00000000,
				 mt0_ = 32'h00000000,
				 mt1_ = 32'h00000000,
				 mt2_ = 32'h00000000,
				 _vrsn_out = 32'h00000000,
				 kt_ = 32'h00000000;
	
	logic [31:0] ms_0 [0:7] = '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
	logic [31:0] ms_1 [0:7] = '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
	logic [31:0] ms_2 [0:7] = '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
	
	logic [31:0] _ms_0 [0:7] = '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
	logic [31:0] _ms_1 [0:7] = '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
	logic [31:0] _ms_2 [0:7] = '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
	
	logic [31:0] data_1 [0:15] = data0;
	logic [31:0] data_2 [0:15] = data0;
		  
	assign iniztn_cmpltd_clk = system_clk && rst;
	assign new_data_in = ({blk_hdr_data[0],blk_hdr_data[1],blk_hdr_data[2],blk_hdr_data[3],blk_hdr_data[4],blk_hdr_data[5],
						   blk_hdr_data[6],blk_hdr_data[7],blk_hdr_data[8],blk_hdr_data[9],blk_hdr_data[10],blk_hdr_data[11],
						   blk_hdr_data[12],blk_hdr_data[13],blk_hdr_data[14],blk_hdr_data[15],blk_hdr_data[16],blk_hdr_data[17],
						   blk_hdr_data[18],blk_hdr_data[19]}==blk_hdr)?1'b0:1'b1;
	assign vrsn_updt_clk = clk && vrn_cir_complt_flg;	  
	assign core_en_clk = clk && (validOut_0 || validOut_1 || validOut_2);
	assign chk_core_otpts = clk && ( ((blk_fnd != 2'b00)?1'b1:1'b0) || inc_vrn_flg);
	assign vrsn_inc_clk = clk && inc_vrn_flg_;
	
	assign non_out = crnt_nonce;
	assign tme_out = cr_tme;
	assign vrsn_out = _vrsn_out;

	
	
//----------utility functions ---- start
	get_vrns vrns_inst0(clk, vrsn_en, vrsn, vrn_cir_complt_flg, vrsn0, vrsn1, vrsn2);
	clock_unit clk_unt(clk,rst,sec_tick);
	counter counter_inst0 (clk, rst, cntr_en, r_cntr);
//----------utility functions ---- end	

	
//----------pre-processing functions ---- start
	SHA256 #(4'b0001) sha_inst0 (clk, rst, ms_0_en , r_cntr, iv, kt_, mt0_, ms_0, validOut_0);
	SHA256 #(4'b0010) sha_inst1 (clk, rst, ms_1_en , r_cntr, iv, kt_, mt1_, ms_1, validOut_1);
	SHA256 #(4'b0011) sha_inst2 (clk, rst, ms_2_en , r_cntr, iv, kt_, mt2_, ms_2, validOut_2);
//----------pre-processing functions ---- end	
	
	Core core_inst0(clk, core_rst, core_en, sec_tick, iv, kt, data1, _ms_0, _ms_1, _ms_2,  cr_tme, crnt_nonce, blk_fnd, inc_vrn_flg);
		
	always @(posedge iniztn_cmpltd_clk)begin
		rst<=1'b0;
		core_rst<=1'b0;
		vrsn_en <= 1'b1;
		cntr_en <= 1'b0;
		sec_tick <= 1'b0;
		tme_flg <= 1'b0;
		validOut_0 <= 1'b0;
		validOut_1 <= 1'b0;
		validOut_2 <= 1'b0;
		vrn_cir_complt_flg <= 1'b0;
		inc_vrn_flg <= 1'b0;
		inc_vrn_flg_ <= 1'b0;
		core_en <= 1'b0;
		vrsn_en_clk <= 1'b0;
		ms_0_en <= 1'b0;
		ms_1_en <= 1'b0;
		ms_2_en <= 1'b0;
		blk_fnd <= 2'b00;
		r_cntr <= 6'b000000;
		cr_tme <= 32'h00000000;
		crnt_nonce <= 32'h00000000;
		vrsn2 <= 32'h00000000;
		vrsn1 <= 32'h00000000;
		vrsn0 <= 32'h00000000;
		tme <= data1[1];
		mt0_ <= 32'h00000000;
		mt1_ <= 32'h00000000;
		mt2_ <= 32'h00000000;
		ms_0 <= '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
		ms_1 <= '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
		ms_2 <= '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
		_ms_0 <= '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
		_ms_1 <= '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
		_ms_2 <= '{32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};		
		data_1 [0:15] = data0;
		data_2 [0:15] = data0;
		clk_en <= 1'b1;
//		$display("blk_hdr: %h",blk_hdr);
//		$display("data0 = %h" , {data0[0],data0[1],data0[2],data0[3],data0[4],data0[5],data0[6],data0[7],data0[8],data0[9],data0[10],data0[11],data0[12],
//											data0[13],data0[14],data0[15]});
//		$display("data_1 = %h" , {data_1[0],data_1[1],data_1[2],data_1[3],data_1[4],data_1[5],data_1[6],data_1[7],data_1[8],data_1[9],data_1[10],data_1[11],data_1[12],
//											data_1[13],data_1[14],data_1[15]});
//		$display("data_2 = %h" , {data_2[0],data_2[1],data_2[2],data_2[3],data_2[4],data_2[5],data_2[6],data_2[7],data_2[8],data_2[9],data_2[10],data_2[11],data_2[12],
//											data_2[13],data_2[14],data_2[15]});
		$display("initialization completed" );
	end
	
	
	
	always @(posedge system_clk or negedge system_clk)begin
		if (clk_en == 1'b1) begin
			clk <= system_clk;
			//non_out <= crnt_nonce;
		end
	end
	
	always_comb begin
		kt_ <= kt[r_cntr];
	end
	
//	always @(*) begin
//		if (rst == 1'b1) begin
//			rst <= 1'b0;
//		end
//	end
	
	//when the blcok header changes from UART reset all downstream devices
	//always @( blk_hdr) begin
	always @(posedge new_data_in) begin
		//reset everything
		blk_hdr_data={blk_hdr[639:608], blk_hdr[607:576], blk_hdr[575:544], blk_hdr[543:512],blk_hdr[511:480], blk_hdr[479:448], blk_hdr[447:416], blk_hdr[415:384],
					  blk_hdr[383:352], blk_hdr[351:320], blk_hdr[319:288], blk_hdr[287:256],blk_hdr[255:224], blk_hdr[223:192], blk_hdr[191:160], blk_hdr[159:128],
					  blk_hdr[127:96], blk_hdr[95:64], blk_hdr[63:32], blk_hdr[31:0]};
		data0 = '{ blk_hdr[639:608], blk_hdr[607:576], blk_hdr[575:544], blk_hdr[543:512],
				   blk_hdr[511:480], blk_hdr[479:448], blk_hdr[447:416], blk_hdr[415:384],
				   blk_hdr[383:352], blk_hdr[351:320], blk_hdr[319:288], blk_hdr[287:256],
				   blk_hdr[255:224], blk_hdr[223:192], blk_hdr[191:160], blk_hdr[159:128]};
		data1= '{ blk_hdr[127:96], blk_hdr[95:64], blk_hdr[63:32], blk_hdr[31:0],
				32'h80000000, 32'h00000000, 32'h00000000, 32'h00000000,
				32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
				32'h00000000, 32'h00000000, 32'h00000000, 32'h00000280 };
		rst<=1'b1;
		core_rst<=1'b1;
		vrsn = blk_hdr[639:608];
		shdw_vrsn = blk_hdr[639:608];
	end
		
	//not good... version feild has overflown with nonce values
	always @(posedge vrn_ovr_flw_flg) begin
		// sound all bells and figure out what to do...
		vrsn <= 32'h00000000;
		shdw_vrsn <= 32'h00000000;
		rst<=1'b0;
		clk_en<=1'b0;
		vrsn_en<=1'b0;
		cntr_en<=1'b0;
		ms_0_en<=1'b0;
		ms_1_en<=1'b0;
		ms_2_en<=1'b0;
		core_en<=1'b0;
		vrn_cir_complt_flg<=1'b0;
		validOut_0<=1'b0;
		validOut_1<=1'b0;
		validOut_2<=1'b0;
		inc_vrn_flg<=1'b0;
		blk_fnd<=2'b00;
		inc_vrn_flg_ <= 1'b0;
	end
		
	//version_nonce_feild + 1
	always @(posedge vrsn_inc_clk) begin
		vrsn <= shdw_vrsn;
		rst <= 1'b1;
		inc_vrn_flg_ <= 1'b0;
		vrsn_en<=1'b1;
	end
	
	always @(posedge chk_core_otpts) begin
		if (blk_fnd != 2'b00)begin //block was found
			//tme_out <= cr_tme;
			//non_out <= crnt_nonce;
			if(blk_fnd == 2'b01) begin
				_vrsn_out <= vrsn0;
			end 
			if(blk_fnd == 2'b10) begin
				_vrsn_out <= vrsn1;			
			end 
			if(blk_fnd == 2'b11) begin
				_vrsn_out <= vrsn2;
			end
			blk_fnd_flg_out <= 1'b1;
		end else begin
			inc_vrn_flg_ <= 1'b1;
			blk_fnd_flg_out <= 1'b0;
		end 
	end
	
	logic trgr = 1'b0;
	always @(posedge core_en_clk) begin
		if(trgr == 1'b1) begin
			trgr = 1'b0;
			_ms_0 = ms_0;
			_ms_1 = ms_1;
			_ms_2 = ms_2;
			core_en = 1'b1;
			ms_0_en = 1'b0;
			ms_1_en = 1'b0;
			ms_2_en = 1'b0;
			validOut_0 <= 1'b0;
			validOut_1 <= 1'b0;
			validOut_2 <= 1'b0;
			cntr_en = 1'b0;
			$display("Core started" );
		end
 		if ({validOut_0,validOut_1,validOut_2} == 3'b111 && r_cntr == 63)begin
			trgr = 1'b1;
		end
	end
			
	always @(posedge vrsn_updt_clk)begin
		if(vrsn0 != 32'h00000000)begin
			data0[0]=vrsn0;
			ms_0_en = 1'b1;
			shdw_vrsn=vrsn0;
		end
		if(vrsn1 != 32'h00000000)begin
			data_1[0]=vrsn1;
			ms_1_en = 1'b1;
			shdw_vrsn=vrsn1;
		end
		if(vrsn2 != 32'h00000000)begin
			data_2[0]=vrsn2;
			ms_2_en = 1'b1;
			shdw_vrsn=vrsn2;
		end
		if({ms_0_en,ms_1_en,ms_2_en} == 3'b000)begin
			vrn_ovr_flw_flg<=1'b1;
		end else cntr_en = 1'b1;
		vrn_cir_complt_flg<=1'b0;
		vrsn_en<=1'b0;
	end
	
	always @(*)begin
		if (ms_0_en == 1'b1)begin
			mt0_<=data0[r_cntr%16];
		end
		if (ms_1_en == 1'b1)begin
			mt1_<=data_1[r_cntr%16];	
		end
		if (ms_2_en == 1'b1)begin		
			mt2_<=data_2[r_cntr%16];
		end
	end
	
endmodule





module get_vrns(input logic clk, en, input logic[31:0] crnt_vrsn, output logic cir_cmpltn_flg, output logic[31:0] vrsn_0, vrsn_1, vrsn_2);
	logic cir_clk_0;
	logic[31:0] _crnt_vrsn,_vrsn_0, _vrsn_1, _vrsn_2;
	//assign _crnt_vrsn = crnt_vrsn[28:13];
	assign cir_clk_0 = ~clk && en; 
	
	endian_swap_32b ins_0(crnt_vrsn,_crnt_vrsn);
	endian_swap_32b ins_1(_vrsn_0,vrsn_0);
	endian_swap_32b ins_2(_vrsn_1,vrsn_1);
	endian_swap_32b ins_3(_vrsn_2,vrsn_2);

	always_ff @(posedge cir_clk_0) begin
		cir_cmpltn_flg=1'b0;
		//$display("                                                                                            crnt_vrsn: %h   | crnt_vrsn[27:13]: %h",crnt_vrsn, crnt_vrsn[27:13]);
		if(crnt_vrsn[27:13] <= 16'h7fff && crnt_vrsn[27:12] != 16'hffff ) begin  //if (vrsn + 1'b1 has NOT rolled outside of bits 13-28) begin
			_vrsn_0 <= _crnt_vrsn;
		end else begin
			_vrsn_0 <= 32'h00000000;
		end		
		if(crnt_vrsn[27:13] + 1'b1 <= 16'h7fff) begin
			_vrsn_1 <= {_crnt_vrsn[31:28], _crnt_vrsn[27:13] + 1'b1, _crnt_vrsn[12:0]};
		end else begin
			_vrsn_1 <= 32'h00000000;
		end
		if(crnt_vrsn[27:13] + 2'b10 <= 16'h7fff) begin
			_vrsn_2 <= {_crnt_vrsn[31:28], _crnt_vrsn[27:13] + 2'b10, _crnt_vrsn[12:0]};
		end else begin
			_vrsn_2 <= 32'h00000000;
		end
		cir_cmpltn_flg<=1'b1;
	end
endmodule


module endian_swap_32b(input logic[31:0] val_in, output logic[31:0] val_out);
//|   31 30 29 28 - 27 26 25 24 - 23 22 21 20 - 19 18 17 16 - 15 14 13 12 - 11 10 9 8 - 7 6 5 4 - 3 2 1 0   |
//-------------------------------------------------|---------------------------------------------------------
//                                                 |
//                                                 V
// ----------------------------------------------------------------------------------------------------------
// | 7 6 5 4 - 3 2 1 0 -- 15 14 13 12 - 11 10 9 8 -- 23 22 21 20 - 19 18 17 16 -- 31 30 29 28 - 27 26 25 24 |
	always_comb begin
		val_out <= {val_in[7:0],val_in[15:8],val_in[23:16],val_in[31:24]};
	end
endmodule


