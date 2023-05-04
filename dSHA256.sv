module dSHA256 (input logic clk, rst, en0, input wire [5:0] r_cntr, input wire [31:0] iv_ [0:7], input logic [31:0] kt, mt0, mt1, output logic [31:0] wreg_ [0:7]);
	logic [31:0] hash0 [0:7];
	logic [31:0] hash1 [0:7];
	logic [31:0] hash_ff [0:7];
	logic [31:0] hash_pad [0:15];
	logic en1, en2, en3, lstRnd;
	logic [31:0] mt2;
	/*
	assign hash_pad[0] = hash1[0];
	assign hash_pad[1] = hash1[1];
	assign hash_pad[2] = hash1[2];
	assign hash_pad[3] = hash1[3];
	assign hash_pad[4] = hash1[4];
	assign hash_pad[5] = hash1[5];
	assign hash_pad[6] = hash1[6];
	assign hash_pad[7] = hash1[7];
	*/
	assign hash_pad[8] = 32'h80000000;
	assign hash_pad[9] = 32'h00000000;
	assign hash_pad[10] = 32'h00000000;
	assign hash_pad[11] = 32'h00000000;
	assign hash_pad[12] = 32'h00000000;
	assign hash_pad[13] = 32'h00000000;
	assign hash_pad[14] = 32'h00000000;
	assign hash_pad[15] = 32'h00000100;
	
	assign lstRnd = (r_cntr==6'd63)&clk ? 1 : 0;
	
	always_comb begin
		mt2 <= hash_pad[r_cntr];
		
		if(lstRnd) begin
		/*hash_pad[0] <= hash1[0];
		hash_pad[1] <= hash1[1];
		hash_pad[2] <= hash1[2];
		hash_pad[3] <= hash1[3];
		hash_pad[4] <= hash1[4];
		hash_pad[5] <= hash1[5];
		hash_pad[6] <= hash1[6];
		hash_pad[7] <= hash1[7];*/
		hash_pad[0:7] <= hash1;
		end
		else begin
			hash_pad[0:7] <= hash_ff;
		end
	end
	
	always_ff @ (posedge lstRnd) begin
			hash_ff <= hash1;
	end
	
	
	SHA256 sha_inst0 (clk, rst, en0, r_cntr, iv_, kt, mt0, hash0, en1);
	SHA256 sha_inst1 (clk, rst, en1, r_cntr, hash0, kt, mt1, hash1, en2);
	SHA256 sha_inst2 (clk, rst, en2, r_cntr, iv_, kt, mt2, wreg_, en3);
endmodule

module dSHA256_tb ();

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

	logic clk, rst, en;
	logic [5:0] r_cntr;
	logic [31:0] kt_, mt0_, mt1_;
	logic [31:0] wreg_ [0:7];
	
	dSHA256 dsha_inst0 (clk, rst, en, r_cntr, iv, kt_, mt0_, mt1_, wreg_);
	counter counter_inst0 (clk, rst, en, r_cntr);
	
	always_comb begin
		mt0_<=header0[r_cntr%16];
		mt1_<= header1[r_cntr%16];
		kt_ <= kt[r_cntr];
	end

	initial begin
		clk<=0; rst<=0; en<=0; #5;
		rst<=1; #5;
		rst<=0; #5;
		en<=1; #5;
		for(int j=0; j<193; j = j + 1) begin
			clk <= 1; #5;
			clk <= 0; #5;
		end
	end
endmodule