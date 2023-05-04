 module SHA256 #(parameter core=4'b0)(input logic clk, rst, en, input wire [5:0] r_cntr, input wire [31:0] iv_ [0:7], input logic [31:0] kt, mt, output logic [31:0] wreg_ [0:7], output logic validOut);
	logic [31:0] wt, _ktwt;
	
	SCHr #(core) scheduler_inst0 (clk, rst, en, r_cntr, mt, wt);
	KtWt #(core) ktwt_inst_0(clk, rst, en, r_cntr, kt, wt, _ktwt);
	CMPr #(core) compressor_inst0 (clk, rst, en, r_cntr, iv_, _ktwt, wreg_, validOut);
	
//	SCHr #(core) scheduler_inst0 (clk, rst, en, r_cntr, mt, wt);
//	KtWt #(core) ktwt_inst_0(clk, rst, en, r_cntr, kt, wt, _ktwt);
//	CMPr #(core) compressor_inst0 (clk, rst, en, r_cntr, iv_, kt, wt, _ktwt, wreg_, validOut);
	
 endmodule