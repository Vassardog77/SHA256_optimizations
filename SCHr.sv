module SCHr #(parameter core=4'b0,sha=2'b0)(input logic clk, rst, en, input wire [5:0] r_cntr, input logic [31:0] mt, output logic [31:0] wt);

	logic [31:0] rreg [15:0];
	logic [31:0] rreg_n [15:0];
	logic [31:0] sig0_, sig1_;

	sig_0 sig0_inst (rreg[14], sig0_); // SIGMA_0 is tied to the output of R14
	sig_1 sig1_inst (rreg[1], sig1_); // SIGMA_1 is tied to the output of R1
	
	assign wt = rreg_n[0];
	
	always_comb begin
		if (en == 1'b1) begin //<<--- add this line on 3/22/23 to save power
			if(r_cntr < 16)
				rreg_n[0] <= mt;
			else
				rreg_n[0] <= rreg[15] + rreg[6] + sig0_ + sig1_;
			
			for(int i=1; i<16; i=i+1)
				rreg_n[i] <= rreg[i-1];
		end  //<<--- add this line on 3/22/23 to save power
	end
	
	always_ff @ (posedge rst or posedge clk) begin
		if(rst)
			rreg[0] <= mt;
		else
			if(en) begin
				rreg <= rreg_n;
			end
	end

endmodule



























module SCHr_tb ();
	logic [31:0] header0 [0:15] = '{ 32'h01000000, 32'h9500c43a, 32'h25c62452, 32'h0b5100ad, 
	32'hf82cb9f9, 32'hda72fd24, 32'h47a496bc, 32'h600b0000,
	32'h00000000, 32'h6cd86237, 32'h0395dedf, 32'h1da2841c,
	32'hcda0fc48, 32'h9e3039de, 32'h5f1ccdde, 32'hf0e83499 };
	
	logic clk, rst, en;
	logic [5:0] r_cntr;
	logic [31:0] mt, wt;
	
	assign mt = header0[r_cntr];
	
	SCHr SCHr_inst0 (clk, rst, en, r_cntr, mt, wt);
	counter cntr_inst0 (clk, rst, en, r_cntr);
	
	initial begin
		clk=0; rst=0; en=0; #5;
		rst=1; #5; rst=0; #5;
		en=1; #5;
		
		
		for (int j=0; j<193; j=j+1) begin
			clk=1; #5; clk=0; #5;
			$display("Round: %d 	| Input: %h 	| Output: %h", r_cntr, mt, wt);
		end
		
	end
endmodule