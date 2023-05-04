module SCHr_top (input logic clk, rst_, input logic [3:0] button_, input logic [9:0] switch_, output reg [9:0] led, output logic [6:0] hex [5:0]);
	logic rst, clk_, en;
	logic [3:0] button;
	logic [9:0] switch, led_;
	logic [23:0] wt_disp, wt_disp_;
	logic [31:0] mt0_, mt1_, wt, kt_;
	logic [5:0] r_cntr;
	logic [31:0] hash0 [0:7];
	logic [31:0] wreg_ [0:7];
	logic [2:0] ien, ien_;
	
	assign rst = ~rst_;
	assign button = ~button_;
	assign clk_ = ~button_[0];
	//assign led = {ien_, switch[6:0]};
	//assign led[2:0] = ien;
	assign en = switch_[6];
	
	logic [31:0] header0 [0:15] = '{ 32'h01000000, 32'h9500c43a, 32'h25c62452, 32'h0b5100ad, 
	32'hf82cb9f9, 32'hda72fd24, 32'h47a496bc, 32'h600b0000,
	32'h00000000, 32'h6cd86237, 32'h0395dedf, 32'h1da2841c,
	32'hcda0fc48, 32'h9e3039de, 32'h5f1ccdde, 32'hf0e83499 };
	
	logic [31:0] header1 [0:15] = '{ 32'h1a65600e, 32'ha6c8cb4d, 32'hb3936a1a, 32'he3143991,
	32'h80000000, 32'h00000000, 32'h00000000, 32'h00000000,
	32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
	32'h00000000, 32'h00000000, 32'h00000000, 32'h00000280 };
	
	logic [31:0] iv[0:7] = '{32'h6a09e667, 32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
	
	logic [31:0] kt [0:63] = '{32'h428A2F98,32'h71374491,32'hB5C0FBCF,32'hE9B5DBA5,32'h3956C25B,32'h59F111F1,32'h923F82A4,32'hAB1C5ED5,32'hD807AA98,
	32'h12835B01,32'h243185BE,32'h550C7DC3,32'h72BE5D74,32'h80DEB1FE,32'h9BDC06A7,32'hC19BF174,32'hE49B69C1,32'hEFBE4786,32'h0FC19DC6,32'h240CA1CC,
	32'h2DE92C6F,32'h4A7484AA,32'h5CB0A9DC,32'h76F988DA,32'h983E5152,32'hA831C66D,32'hB00327C8,32'hBF597FC7,32'hC6E00BF3,32'hD5A79147,32'h06CA6351,
	32'h14292967,32'h27B70A85,32'h2E1B2138,32'h4D2C6DFC,32'h53380D13,32'h650A7354,32'h766A0ABB,32'h81C2C92E,32'h92722C85,32'hA2BFE8A1,32'hA81A664B,
	32'hC24B8B70,32'hC76C51A3,32'hD192E819,32'hD6990624,32'hF40E3585,32'h106AA070,32'h19A4C116,32'h1E376C08,32'h2748774C,32'h34B0BCB5,32'h391C0CB3,
	32'h4ED8AA4A,32'h5B9CCA4F,32'h682E6FF3,32'h748F82EE,32'h78A5636F,32'h84C87814,32'h8CC70208,32'h90BEFFFA,32'hA4506CEB,32'hBEF9A3F7,32'hC67178F2};
	
	dSHA256 sha_inst0 (clk_, rst, en, r_cntr, iv, kt_, mt0_, mt1_, wreg_);
	//SHA256 sha_inst1 (clk_, rst, en, r_cntr, iv, kt_, mt0_, wreg_, en1);
	counter counter_inst0 (clk_, rst, en, r_cntr);
	hexOutput hexout_inst0 (wt_disp, hex);
	
	always_comb begin
		mt0_ <= header0[r_cntr];
		mt1_ <= header1[r_cntr];
		kt_ <= kt[r_cntr];
		
		if(switch_[0] == 0)
			wt_disp <= {2'h0, r_cntr, wreg_[switch_[3:1]][15:0]};
		else
			wt_disp <= {2'h0, r_cntr, wreg_[switch_[3:1]][31:16]};
	end
endmodule