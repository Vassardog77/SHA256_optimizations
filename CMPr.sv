module CMPr #(parameter core=4'b0,sha=2'b0)(input logic clk, rst, en, input wire [5:0] r_cntr,
input wire [31:0] iv_ [0:7], input logic [31:0] ktwt,
output logic [31:0] wreg_ [0:7], output logic validOut);

	logic [31:0] wreg [0:7];
	logic [31:0] Sig0_, Sig1_, major_, chs_, t1, t2;
	
	logic nonce_0; //has nonce 00000000 been calculated yet (nonce_0) (check what hte value of nonce is to see)
	logic [31:0] wreg_r3 [0:7];
	logic [31:0] wreg_r4 [0:7];
	logic [31:0] iv [0:7];
	
	logic clk_gate = 1'b0; //creating clock gate
	logic int_clk, othr_sha_clks, wrkg_regs_savd=1'b0, ckpt=1'b0;

	assign int_clk = clk && clk_gate && sha==2'b01 && ((wrkg_regs_savd==1'b1)?((r_cntr >= 3)?1'b1:1'b0):1'b1); //using to tie the clock and clock gating together so that clock can be turned on and off
	assign othr_sha_clks= clk && ( ((sha==2'b00)?1'b1:1'b0) || ((sha==2'b10)?1'b1:1'b0) ); 
	
	//ENDIAN VARIABLES START
	logic inc_wreg_a_flg_clk, inc_wreg_e_flg_clk, wreg_a_inc_flg = 1'b0, wreg_e_inc_flg = 1'b0;
	logic[31:0] nxt_wreg_a ,_crnt_wreg_a, nxt_wreg_e , _crnt_wreg_e;
	//ENDIAN VARIABLES END
	
	
	//ENDIAN SWAP START
	assign inc_wreg_a_flg_clk = clk && wreg_a_inc_flg && ((sha==2'b01)?1'b1:1'b0);
	assign inc_wreg_e_flg_clk = clk && wreg_e_inc_flg && ((sha==2'b01)?1'b1:1'b0);

	inc_reg_val ins_0(_crnt_wreg_a,nxt_wreg_a,wreg_a_inc_flg);
	inc_reg_val ins_1(_crnt_wreg_e,nxt_wreg_e,wreg_e_inc_flg);
	

	always_ff @(posedge inc_wreg_a_flg_clk) begin
		$display("%d   |  _crnt_wreg_a= %h  |   nxt_wreg_a= %h    |             |             |             |             |              |   %d   |   %d   |" , 
							r_cntr,_crnt_wreg_a,nxt_wreg_a,sha,core);
//						$display("int_clk: %b  | c clk: %b  | clk_gate: %b  | sha: %d  | cond1: %b  | core: %d", 
//									int_clk, clk, clk_gate, sha, ((wrkg_regs_savd==1'b1)?((r_cntr >= 3)?1'b1:1'b0):1'b1),core );
		wreg[0] = nxt_wreg_a; //inrementing the saved values
		wreg_r4[0] = nxt_wreg_a;
		wreg_a_inc_flg = 1'b0;
	end

	always_ff @(posedge inc_wreg_e_flg_clk) begin
		$display("%d   |  _crnt_wreg_e= %h  |   nxt_wreg_e= %h    |             |             |             |             |              |   %d   |   %d   |" , 
							r_cntr,_crnt_wreg_e,nxt_wreg_e,sha,core);
//						$display("int_clk: %b  | c clk: %b  | clk_gate: %b  | sha: %d  | cond1: %b  | core: %d", 
//									int_clk, clk, clk_gate, sha, ((wrkg_regs_savd==1'b1)?((r_cntr >= 3)?1'b1:1'b0):1'b1),core );
		wreg[4] = nxt_wreg_e; //inrementing the saved values
		wreg_r4[4] = nxt_wreg_e;
		wreg_e_inc_flg = 1'b0;
	end


	//ENDIAN SWAP END
	
	
	Sig0 Sig0_inst(wreg[0], Sig0_); // sigma 0
	Sig1 Sig1_inst(wreg[4], Sig1_); // sigma 1
	maj maj_inst(wreg[0], wreg[1], wreg[2], major_); // majority
	ch ch_inst(wreg[4], wreg[5], wreg[6], chs_); // choose
	
	always_comb begin
		if (en == 1'b1) begin //<<--- add this line on 3/22/23 to save power
			t1 = wreg[7] + Sig1_ + chs_ + ktwt;
			t2 = Sig0_ + major_;
		
			if(r_cntr == 63) begin
				wreg_[7] <= wreg[6] + iv_[7];
				wreg_[6] <= wreg[5] + iv_[6];
				wreg_[5] <= wreg[4] + iv_[5];
				wreg_[4] <= wreg[3] + t1 + iv_[4];
				wreg_[3] <= wreg[2] + iv_[3];
				wreg_[2] <= wreg[1] + iv_[2];
				wreg_[1] <= wreg[0] + iv_[1];
				wreg_[0] <= t1 + t2 + iv_[0];
			end
			else begin 
				wreg_[7] <= wreg[6];
				wreg_[6] <= wreg[5];
				wreg_[5] <= wreg[4];
				wreg_[4] <= wreg[3] + t1;
				wreg_[3] <= wreg[2];
				wreg_[2] <= wreg[1];
				wreg_[1] <= wreg[0];
				wreg_[0] <= t1 + t2;
			end
		end //<<--- add this line on 3/22/23 to save power
	end
	
//	always_ff @ (posedge rst or posedge clk) begin
//		if(rst) begin
//			wreg <= iv_;
//			validOut <= 0;
//		end
//		else begin
//			if (en == 1'b1) begin //<<--- add this line on 3/22/23 to save power
//				if(r_cntr == 63) begin
//					wreg <= iv_;
//				end
//				else begin
//					if(en) begin
//						if(r_cntr == 62) begin
//							validOut <= 1;
//						end
//						wreg <= wreg_;
//					end
//				end
//			end //<<--- add this line on 3/22/23 to save power
//		end
//	end


	always_ff @ (posedge rst) begin
		if(rst) begin
			wreg <= iv_;
			validOut <= 0;
			nonce_0 <= 1'b0;
			if(sha==2'b01) clk_gate = 1'b1;
			else clk_gate = 1'b0;
			wrkg_regs_savd=1'b0;
		end
	end

	always_ff @ (posedge othr_sha_clks) begin
		if (en == 1'b1) begin //<<--- add this line on 3/22/23 to save power
			case(r_cntr)
				63:  wreg <= iv_;
				62:  validOut <= 1;
				default: begin
					if(sha==2'b01 && r_cntr==0) clk_gate = 1'b1;
				end
			endcase
//			$display("%d   |            |             |             |             |             |             |             |             |              |   %d   |   %d   | here" , 
//								r_cntr,sha,core);
			wreg <= wreg_;
		end //<<--- add this line on 3/22/23 to save power
	end





	
//	always_ff @ (posedge clk) begin 
//		//CLOCK GATING
//		if (nonce_0 == 1 & r_cntr == 2 & sha==2'b01) begin
//			clk_gate = 1'b1;
//			$display("%d   |            |             |             |             |             |             |             |             |              |   %d   |   %d   | clock gating on" , 
//								r_cntr,sha,core);
//		end
//
//	end


//	always_ff @ (negedge int_clk) 						$display("int_clk: %b  | c clk: %b  | clk_gate: %b  | sha: %d  | cond1: %b  | core: %d", 
//									int_clk, clk, clk_gate, sha, ((wrkg_regs_savd==1'b1)?((r_cntr >= 3)?1'b1:1'b0):1'b1),core );
											 
		
	
	always_ff @ (posedge int_clk) begin 
		if(r_cntr == 63) begin
			wreg <= iv_;
			//changing nonce_0 to 1
			$display("%d   |            |             |             |             |             |             |             |             |              |   %d   |   %d   | changing nonce_0 to 1" , 
								r_cntr,sha,core);
			wrkg_regs_savd=1'b1;
			nonce_0 <= 1'b1;
//			clk_gate = 1'b0;
//			$display("%d   |            |             |             |             |             |             |             |             |              |   %d   |   %d   | clock gating off" , 
//								r_cntr,sha,core);
		end
		else begin
			if(en) begin
				if(r_cntr == 62) begin
					validOut <= 1;
					wreg <= wreg_;
				end
				//optimization 6.4 BEGIN
				else if (r_cntr == 3 & sha==2'b01) begin //on round 3 and sha 1
					if (nonce_0) begin
						if (ckpt==0)begin
						
						$display("%d   |            |             |             |             |             |             |             |             |              |   %d   |   %d   | optimization loading 6.4 values" , 
											r_cntr,sha,core);
											
											
//						$display("int_clk: %b  | c clk: %b  | clk_gate: %b  | sha: %d  | cond1: %b  | core: %d", 
//									int_clk, clk, clk_gate, sha, ((wrkg_regs_savd==1'b1)?((r_cntr >= 3)?1'b1:1'b0):1'b1),core );
											
											
											
						_crnt_wreg_e <= wreg_r4[4];
						_crnt_wreg_a <= wreg_r4[0];
						wreg[1] = wreg_r4[1];
						wreg[2] = wreg_r4[2];
						wreg[3] = wreg_r4[3];
						wreg[5] = wreg_r4[5];
						wreg[6] = wreg_r4[6];
						wreg[7] = wreg_r4[7];
						end
						ckpt=1;
					end
					else begin
						$display("%d   |            |             |             |             |             |             |             |             |              |   %d   |   %d   | optimization 6.4 saving values" , 
											r_cntr,sha,core);
						wreg_r4 <= wreg_; //store the A-H values in a register to save it 
						wreg <= wreg_;
					end
				end
				//optimization 6.4 END
				else begin
					ckpt=0;
					wreg <= wreg_;
				end
			end
		end	
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//---VVV---- added this always block on 3/22/23 to A-H values ---VVV----//
	logic prnt_msg, prnt_msg_2;
	assign prnt_msg = en && ((r_cntr == 6'b0)?1'b1:1'b0); //&& clk
	assign prnt_msg_2 = en && ((r_cntr != 6'b0)?1'b1:1'b0); // && clk
	
	always @(posedge clk)begin
		if (prnt_msg) begin
			$display("");
			$display("");
			$display("SHA = %d  | CORE = %d", sha,core);
			$display("A = %h" , iv_[0]);
			$display("B = %h" , iv_[1]);
			$display("C = %h" , iv_[2]);
			$display("D = %h" , iv_[3]);
			$display("E = %h" , iv_[4]);
			$display("F = %h" , iv_[5]);
			$display("G = %h" , iv_[6]);
			$display("H = %h" , iv_[7]);
			$display("");
			//$display("");
			//$display("");
			$display("idx  |     A      |      B      |      C      |      D      |      E      |      F      |      G      |      H      |     ktwt     |  SHA  |  CORE  |");
			$display("-----------------------------------------------------------------------------------------------------------------------------------------------------");
//			
//			$display("idx  |     A      |      B      |      C      |      D      |      E      |      F      |      G      |      H      |      kt     |     wt     |     ktwt     |  SHA  |  CORE  |");
//			$display("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			case(sha)
				2'b00 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h   |   %d   |   %d   |" , 
											r_cntr,wreg[0],wreg[1],wreg[2],wreg[3],wreg[4],wreg[5],wreg[6],wreg[7], ktwt,2'b0,core);
				2'b01 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h   |   %d   |   %d   |" ,  
											r_cntr,wreg[0],wreg[1],wreg[2],wreg[3],wreg[4],wreg[5],wreg[6],wreg[7], ktwt,2'b01,core);
				2'b10 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h   |   %d   |   %d   |" ,  
											r_cntr,wreg[0],wreg[1],wreg[2],wreg[3],wreg[4],wreg[5],wreg[6],wreg[7], ktwt,2'b10,core);
											
//				2'b00 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |  %h  |   %h   |   %d   |   %d   |" , 
//											r_cntr,wreg[0],wreg[1],wreg[2],wreg[3],wreg[4],wreg[5],wreg[6],wreg[7],kt, wt, ktwt,2'b0,core);
//				2'b01 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |  %h  |   %h   |   %d   |   %d   |" , 
//											r_cntr,wreg[0],wreg[1],wreg[2],wreg[3],wreg[4],wreg[5],wreg[6],wreg[7],kt,wt, ktwt,2'b01,core);
//				2'b10 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |  %h  |   %h   |   %d   |   %d   |" , 
//											r_cntr,wreg[0],wreg[1],wreg[2],wreg[3],wreg[4],wreg[5],wreg[6],wreg[7],kt,wt, ktwt,2'b10,core);
			endcase
		end
		
		if (prnt_msg_2)begin
			if (r_cntr == 63)
				$display("     ----------------------------------------------------------------------------------------------------------------");
				//$display("---------------------------------------------------------------------------------------------------------------------                                      ");
				//$display("----------------------------------------------------------------------------------------------------------------------------------------------------------");
				
			case(sha)
				2'b00 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h   |   %d   |   %d   |" , 
											r_cntr,wreg_[0],wreg_[1],wreg_[2],wreg_[3],wreg_[4],wreg_[5],wreg_[6],wreg_[7], ktwt,2'b0,core);
				2'b01 : begin 
							if (wrkg_regs_savd==1'b1 && 2 >= r_cntr)
								$display("%d   |            |             |             |             |             |             |             |             |              |   %d   |   %d   | opt 6.4 round skipped" , 
											r_cntr,2'b01,core);
							else 
								$display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h   |   %d   |   %d   |" , 
											r_cntr,wreg_[0],wreg_[1],wreg_[2],wreg_[3],wreg_[4],wreg_[5],wreg_[6],wreg_[7], ktwt,2'b01,core);
						end
				2'b10 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h   |   %d   |   %d   |" , 
											r_cntr,wreg_[0],wreg_[1],wreg_[2],wreg_[3],wreg_[4],wreg_[5],wreg_[6],wreg_[7], ktwt,2'b10,core);

//				2'b00 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |  %h  |   %h   |   %d   |   %d   |" , 
//											r_cntr,wreg_[0],wreg_[1],wreg_[2],wreg_[3],wreg_[4],wreg_[5],wreg_[6],wreg_[7],kt,wt, ktwt,2'b0,core);
//				2'b01 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |  %h  |   %h   |   %d   |   %d   |" , 
//											r_cntr,wreg_[0],wreg_[1],wreg_[2],wreg_[3],wreg_[4],wreg_[5],wreg_[6],wreg_[7],kt,wt, ktwt,2'b01,core);
//				2'b10 : $display("%d   |  %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |   %h  |  %h  |   %h   |   %d   |   %d   |" , 
//											r_cntr,wreg_[0],wreg_[1],wreg_[2],wreg_[3],wreg_[4],wreg_[5],wreg_[6],wreg_[7],kt,wt, ktwt,2'b10,core);
			endcase
				
			if (r_cntr == 63)
				$display("     ----------------------------------------------------------------------------------------------------------------");
		
		end
		
	end
	
	
endmodule































module CMPr_tb ();
	logic [31:0] header0 [0:15] = '{ 32'h01000000, 32'h9500c43a, 32'h25c62452, 32'h0b5100ad, 
	32'hf82cb9f9, 32'hda72fd24, 32'h47a496bc, 32'h600b0000,
	32'h00000000, 32'h6cd86237, 32'h0395dedf, 32'h1da2841c,
	32'hcda0fc48, 32'h9e3039de, 32'h5f1ccdde, 32'hf0e83499 };
	
	logic [31:0] iv[0:7] = '{32'h6a09e667, 32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
	
	logic [31:0] kt [0:63] = '{32'h428A2F98,32'h71374491,32'hB5C0FBCF,32'hE9B5DBA5,32'h3956C25B,32'h59F111F1,32'h923F82A4,32'hAB1C5ED5,32'hD807AA98,
	32'h12835B01,32'h243185BE,32'h550C7DC3,32'h72BE5D74,32'h80DEB1FE,32'h9BDC06A7,32'hC19BF174,32'hE49B69C1,32'hEFBE4786,32'h0FC19DC6,32'h240CA1CC,
	32'h2DE92C6F,32'h4A7484AA,32'h5CB0A9DC,32'h76F988DA,32'h983E5152,32'hA831C66D,32'hB00327C8,32'hBF597FC7,32'hC6E00BF3,32'hD5A79147,32'h06CA6351,
	32'h14292967,32'h27B70A85,32'h2E1B2138,32'h4D2C6DFC,32'h53380D13,32'h650A7354,32'h766A0ABB,32'h81C2C92E,32'h92722C85,32'hA2BFE8A1,32'hA81A664B,
	32'hC24B8B70,32'hC76C51A3,32'hD192E819,32'hD6990624,32'hF40E3585,32'h106AA070,32'h19A4C116,32'h1E376C08,32'h2748774C,32'h34B0BCB5,32'h391C0CB3,
	32'h4ED8AA4A,32'h5B9CCA4F,32'h682E6FF3,32'h748F82EE,32'h78A5636F,32'h84C87814,32'h8CC70208,32'h90BEFFFA,32'hA4506CEB,32'hBEF9A3F7,32'hC67178F2};
	
	logic clk, rst, en, validOut;
	logic [5:0] r_cntr;
	logic [31:0] mt, wt, kt_;
	logic [31:0] wreg [0:7];
	
	string temp_str;
	
	assign mt = header0[r_cntr];
	assign kt_ = kt[r_cntr];
	
	SCHr SCHr_inst0 (clk, rst, en, r_cntr, mt, wt);
	CMPr CMPr_inst0 (clk, rst, en, r_cntr, iv, kt_, wt, wreg, validOut);
	counter cntr_inst0 (clk, rst, en, r_cntr);
	
	initial begin
		clk=0; rst=0; en=0; #5;
		rst=1; #5; rst=0; #5;
		en=1; #5;
		
		
		for (int j=0; j<193; j=j+1) begin
			clk=1; #5; clk=0; #5;
			$writeh(temp_str,"%p",wreg);
			$display("Round: %d 	| Valid: %b | Mt: %h 	| Wt: %h 	| Kt: %h	| Wreg: %p", r_cntr, validOut, wt, mt, kt_, temp_str);
		end
		
	end
endmodule