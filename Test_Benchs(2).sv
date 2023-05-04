// module main_tb ();
	// rotr_32_acomb_tb c1();
	// sig_0_acomb_tb c2();
	// sig_1_acomb_tb c3();
	// Sig0_acomb_tb c4();
	// Sig1_acomb_tb c5();
	// Maj_acomb_tb c6();
	// Ch_acomb_tb c7();
// endmodule

// module rotr_32_acomb_tb ();
 
	// reg [31:0] i, o_1, o_2, o_3, o_4, o_5, o_6, o_7, o_8, o_9, o_10, o_11;
	// logic f_1, f_2, f_3, f_4,f_5, f_6, f_7, f_8,f_9, f_10, f_11;
	
	// rotr_32_acomb #(7) r1 (i, o_1, f_1);
	// rotr_32_acomb #(8) r2 (i, o_2, f_2);
	// rotr_32_acomb #(18) r3 (i, o_3, f_3);
	// rotr_32_acomb #(17) r4 (i, o_4, f_4);
	// rotr_32_acomb #(19) r5 (i, o_5, f_5);
	// rotr_32_acomb #(2) r6 (i, o_6, f_6);
	// rotr_32_acomb #(13) r7 (i, o_7, f_7);
	// rotr_32_acomb #(22) r8 (i, o_8, f_8);
	// rotr_32_acomb #(6) r9 (i, o_9, f_9);
	// rotr_32_acomb #(11) r10 (i, o_10, f_10);
	// rotr_32_acomb #(25) r11 (i, o_11, f_11);


	// initial begin
		// f_1=1'b0;
		// f_2=1'b0;
		// f_3=1'b0;
		// f_4=1'b0;
		// f_5=1'b0;
		// f_6=1'b0;
		// f_7=1'b0;
		// f_8=1'b0;
		// f_9=1'b0;
		// f_10=1'b0;
		// f_11=1'b0;

		// i = 32'h77EFBDDA; //let input be 32'h77EFBDDA
		// #5;
		// $display("input = %h", i);
		
		// $display("rotr_32_acomb #(7) = %h, flg = %b, expecting: B4EFDF7B", o_1, f_1);
		// $display("rotr_32_acomb #(8) = %h, flg = %b, expecting: DA77EFBD", o_2, f_2);
		// $display("rotr_32_acomb #(18) = %h, flg = %b, expecting: EF769DFB", o_3, f_3);
		// $display("rotr_32_acomb #(17) = %h, flg = %b, expecting: DEED3BF7", o_4, f_4);
		// $display("rotr_32_acomb #(19) = %h, flg = %b, expecting: F7BB4EFD", o_5, f_5);
		// $display("rotr_32_acomb #(2) = %h, flg = %b, expecting: 9DFBEF76", o_6, f_6);
		// $display("rotr_32_acomb #(13) = %h, flg = %b, expecting: EED3BF7D", o_7, f_7);
		// $display("rotr_32_acomb #(22) = %h, flg = %b, expecting: BEF769DF", o_8, f_8);
		// $display("rotr_32_acomb #(6) = %h, flg = %b, expecting: 69DFBEF7", o_9, f_9);
		// $display("rotr_32_acomb #(11) = %h, flg = %b, expecting: BB4EFDF7", o_10, f_10);
		// $display("rotr_32_acomb #(25) = %h, flg = %b, expecting: F7DEED3B", o_11, f_11);

	// end
	
// endmodule

// module sig_0_acomb_tb ();
 
	// reg [31:0] i_1, i_2, i_3, i_4,
			   // o_1, o_2, o_3, o_4;
	// logic f_1, f_2, f_3, f_4;
			   
	// sig_0_acomb sg1 (1'b1, i_1, o_1, f_1);
	// sig_0_acomb sg2 (1'b1, i_2, o_2, f_2);
	// sig_0_acomb sg3 (1'b1, i_3, o_3, f_3);
	// sig_0_acomb sg4 (1'b1, i_4, o_4, f_4);


	// initial begin
		// f_1=1'b0;
		// f_2=1'b0;
		// f_3=1'b0;
		// f_4=1'b0;
		
		// i_1 = 32'h77EFBDDA;
		// i_2 = 32'h9DFBEF76;
		// i_3 = 32'hF7BB4EFD;
		// i_4 = 32'h69DFBEF7;
		
		// #5;
		
		// $display("sig_0_acomb( %h ) = %h, flg = %b, expecting: 5564B53B", i_1, o_1, f_1);
		// $display("sig_0_acomb( %h ) = %h, flg = %b, expecting: 05592D4E", i_2, o_2, f_2);
		// $display("sig_0_acomb( %h ) = %h, flg = %b, expecting: 36A762AC", i_3, o_3, f_3);
		// $display("sig_0_acomb( %h ) = %h, flg = %b, expecting: 0C5592D4", i_4, o_4, f_4);
		
	// end
	
// endmodule

// module sig_1_acomb_tb ();
 
	// reg [31:0] i_1, i_2, i_3, i_4,
			   // o_1, o_2, o_3, o_4;
	// logic f_1, f_2, f_3, f_4;
			   
	// sig_1_acomb sg1 (1'b1, i_1, o_1, f_1);
	// sig_1_acomb sg2 (1'b1, i_2, o_2, f_2);
	// sig_1_acomb sg3 (1'b1, i_3, o_3, f_3);
	// sig_1_acomb sg4 (1'b1, i_4, o_4, f_4);


	// initial begin
		// f_1=1'b0;
		// f_2=1'b0;
		// f_3=1'b0;
		// f_4=1'b0;
		
		// i_1 = 32'hB4EFDF7B;
		// i_2 = 32'h5564B53B;
		// i_3 = 32'hF7BB4EFD;
		// i_4 = 32'h05592D4E;
		
		// #5;
		
		// $display("sig_1_acomb( %h ) = %h, flg = %b, expecting: 147F971D", i_1, o_1, f_1);
		// $display("sig_1_acomb( %h ) = %h, flg = %b, expecting: CC2F9933", i_2, o_2, f_2);
		// $display("sig_1_acomb( %h ) = %h, flg = %b, expecting: CE9CABF9", i_3, o_3, f_3);
		// $display("sig_1_acomb( %h ) = %h, flg = %b, expecting: B30F944C", i_4, o_4, f_4);

	// end
	
// endmodule

// module Sig0_acomb_tb ();
 
	// reg [31:0] i_1, i_2, i_3, i_4,
			   // o_1, o_2, o_3, o_4;
	// logic f_1, f_2, f_3, f_4;
			   
	// Sig0_acomb sg1 (1'b1, i_1, o_1, f_1);
	// Sig0_acomb sg2 (1'b1, i_2, o_2, f_2);
	// Sig0_acomb sg3 (1'b1, i_3, o_3, f_3);
	// Sig0_acomb sg4 (1'b1, i_4, o_4, f_4);


	// initial begin
		// f_1=1'b0;
		// f_2=1'b0;
		// f_3=1'b0;
		// f_4=1'b0;
		
		// i_1 = 32'h147F971D;
		// i_2 = 32'hCC2F9933;
		// i_3 = 32'hF7BB4EFD;
		// i_4 = 32'h0C5592D4;
		
		// #5;
		
		// $display("Sig0_acomb( %h ) = %h, flg = %b, expecting: 03AB326A", i_1, o_1, f_1);
		// $display("Sig0_acomb( %h ) = %h, flg = %b, expecting: 84F14800", i_2, o_2, f_2);
		// $display("Sig0_acomb( %h ) = %h, flg = %b, expecting: E73A99BB", i_3, o_3, f_3);
		// $display("Sig0_acomb( %h ) = %h, flg = %b, expecting: C3FE5628", i_4, o_4, f_4);

	// end
	
// endmodule

// module Sig1_acomb_tb ();
 
	// reg [31:0] i_1, i_2, i_3, i_4,
			   // o_1, o_2, o_3, o_4;
	// logic f_1, f_2, f_3, f_4;
			   
	// Sig1_acomb sg1 (1'b1, i_1, o_1,f_1);
	// Sig1_acomb sg2 (1'b1, i_2, o_2,f_2);
	// Sig1_acomb sg3 (1'b1, i_3, o_3,f_3);
	// Sig1_acomb sg4 (1'b1, i_4, o_4,f_4);


	// initial begin
		// f_1=1'b0;
		// f_2=1'b0;
		// f_3=1'b0;
		// f_4=1'b0;
		
		// i_1 = 32'h5564B53B;
		// i_2 = 32'h05592D4E;
		// i_3 = 32'h36A762AC;
		// i_4 = 32'hF7BB4EFD;
		
		// #5;
		
		// $display("Sig1_acomb( %h ) = %h, flg = %b, expecting: F865A3E8", i_1, o_1,f_1);
		// $display("Sig1_acomb( %h ) = %h, flg = %b, expecting: 3D436892", i_2, o_2,f_2);
		// $display("Sig1_acomb( %h ) = %h, flg = %b, expecting: B6ED1F7D", i_3, o_3,f_3);
		// $display("Sig1_acomb( %h ) = %h, flg = %b, expecting: F5C764A9", i_4, o_4,f_4);

	// end
	
// endmodule	

// module Maj_acomb_tb ();
 
	// reg [31:0] i_1, i_2, i_3, 
			   // i_4, i_5, i_6,
			   // i_7, i_8, i_9,
			   // i_10, i_11, i_12,
			   // o_1, o_2, o_3, o_4;
	// logic f_1, f_2, f_3, f_4;
			   
			   
	// maj_acomb m1 (i_1, i_2, i_3, o_1, f_1);
	// maj_acomb m2 (i_4, i_5, i_6, o_2, f_2);
	// maj_acomb m3 (i_7, i_8, i_9, o_3, f_3);
	// maj_acomb m4 (i_10, i_11, i_12, o_4, f_4);


	// initial begin
		// f_1=1'b0;
		// f_2=1'b0;
		// f_3=1'b0;
		// f_4=1'b0;
		
		// i_1 = 32'hB4EFDF7B;
		// i_2 = 32'h69DFBEF7;
		// i_3 = 32'hF7BB4EFD;
		
		// i_4 = 32'hEF769DFB;
		// i_5 = 32'h03AB326A;
		// i_6 = 32'hCC2F9933;
		
		// i_7 = 32'h3DFBEF76;
		// i_8 = 32'hF865A3E8;
		// i_9 = 32'h147F971D;
		
		// i_10 = 32'h84F14800;
		// i_11 = 32'hC3FE5628;
		// i_12 = 32'h0C5592D4;
		
		// #5;
		
		// $display("maj_acomb( %h, %h, %h ) = %h, flg = %b, expecting: F5FFDEFF", i_1, i_2, i_3, o_1, f_1);
		// $display("maj_acomb( %h, %h, %h ) = %h, flg = %b, expecting: CF2F997B", i_4, i_5, i_6, o_2, f_2);
		// $display("maj_acomb( %h, %h, %h ) = %h, flg = %b, expecting: 3C7FA77C", i_7, i_8, i_9, o_3, f_3);
		// $display("maj_acomb( %h, %h, %h ) = %h, flg = %b, expecting: 84F55200", i_10, i_11, i_12, o_4, f_4);

	// end
	
// endmodule

// module Ch_acomb_tb ();
 
	// reg [31:0] i_1, i_2, i_3, 
			   // i_4, i_5, i_6,
			   // i_7, i_8, i_9,
			   // i_10, i_11, i_12,
			   // o_1, o_2, o_3, o_4;
	// logic f_1, f_2, f_3, f_4;
			   
	// ch_acomb c1 (i_1, i_2, i_3, o_1,f_1);
	// ch_acomb c2 (i_4, i_5, i_6, o_2,f_2);
	// ch_acomb c3 (i_7, i_8, i_9, o_3,f_3);
	// ch_acomb c4 (i_10, i_11, i_12, o_4,f_4);



	// initial begin
		// f_1=1'b0;
		// f_2=1'b0;
		// f_3=1'b0;
		// f_4=1'b0;
				
		// i_1 = 32'hB4EFDF7B;
		// i_2 = 32'h69DFBEF7;
		// i_3 = 32'hF5FFDEFF;
		
		// i_4 = 32'hEF769DFB;
		// i_5 = 32'h03AB326A;
		// i_6 = 32'h84F55200;
		
		// i_7 = 32'h3DFBEF76;
		// i_8 = 32'hF865A3E8;
		// i_9 = 32'h147F971D;
		
		// i_10 = 32'h3C7FA77C;
		// i_11 = 32'hC3FE5628;
		// i_12 = 32'h0C5592D4;

		// #5;

		// $display("ch_acomb( %h, %h, %h ) = %h, flg = %b, expecting: 61DF9EF7", i_1, i_2, i_3, o_1, f_1);
		// $display("ch_acomb( %h, %h, %h ) = %h, flg = %b, expecting: 03A3526A", i_4, i_5, i_6, o_2, f_2);
		// $display("ch_acomb( %h, %h, %h ) = %h, flg = %b, expecting: 3865B369", i_7, i_8, i_9, o_3, f_3);
		// $display("ch_acomb( %h, %h, %h ) = %h, flg = %b, expecting: 007E16A8", i_10, i_11, i_12, o_4, f_4);		


	// end
	
// endmodule

// module cntr_tb();
// logic clk, r =1'b0;
// logic [5:0] o=6'b0;

// counter c(clk,r,1'b1, o);
	// initial begin
		// repeat(128) begin
			// clk<=1'b1; #1; $display("clk = %b, counter = %d", clk, o);
			// clk<=1'b0; #1; $display("clk = %b", clk);
		// end

	// end
// endmodule

// module schr_tb();
// logic [31:0] wt,w_t;
// logic [63:0][31:0] wrd_ary,wrd_ary_2;
// logic [31:0] A, B, C, D, E, F, G, H, _A, _B, _C, _D, _E, _F, _G, _H;
// logic [7:0][31:0] hreg;
// logic clk, r, en =1'b0;
// logic [5:0] cnt;//=6'b0;
// //logic [511:0] hdata = 512'b011000010110001001100011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
	// initial begin

// //		wrd_ary[15]<=hdata[31:0];
// //		wrd_ary[14]<=hdata[63:32];
// //		wrd_ary[13]<=hdata[95:64];
// //		wrd_ary[12]<=hdata[127:96];
// //		wrd_ary[11]<=hdata[159:128];
// //		wrd_ary[10]<=hdata[191:160];
// //		wrd_ary[9]<=hdata[223:192];
// //		wrd_ary[8]<=hdata[255:224];
// //		wrd_ary[7]<=hdata[287:256];
// //		wrd_ary[6]<=hdata[319:288];
// //		wrd_ary[5]<=hdata[351:320];
// //		wrd_ary[4]<=hdata[383:352];
// //		wrd_ary[3]<=hdata[415:384];
// //		wrd_ary[2]<=hdata[447:416];
// //		wrd_ary[1]<=hdata[479:448];
// //		wrd_ary[0]<=hdata[511:480];
		
		// wrd_ary[0]=32'heb5aa3b8;
		// wrd_ary[1]=32'h17750c26;
		// wrd_ary[2]=32'h9d0db966;
		// wrd_ary[3]=32'hbcb9e3b6;
		// wrd_ary[4]=32'h510e08c6;
		// wrd_ary[5]=32'h83956e46;
		// wrd_ary[6]=32'h3bd10f72;
		// wrd_ary[7]=32'h769bf32e;
		// wrd_ary[8]=32'hfa374467;
		// wrd_ary[9]=32'h3386553a;
		// wrd_ary[10]=32'h46f91c6a;
		// wrd_ary[11]=32'h6b25d1b4;
		// wrd_ary[12]=32'h6116fa6f;
		// wrd_ary[13]=32'hd29b1a56;
		// wrd_ary[14]=32'h9c193635;
		// wrd_ary[15]=32'h10ed77d4;
		
// //		clk<=1'b0; r<=1'b1; #1; $display("clk = %b, r = %b, en = %b, counter = %d", clk, r, en, cnt);
// //		clk<=1'b0; r<=1'b0; #1; $display("clk = %b, r = %b, en = %b, counter = %d", clk, r, en, cnt);
		// $display("clk = %b, counter = %d, wt = %h" , clk, cnt, wrd_ary[cnt]); $display("clk = %b", clk);
		// repeat(70) begin
			// clk<=1'b1; en<=1'b1; #1; $display("clk = %b, counter = %d, wt = %h" , clk, cnt, wrd_ary[cnt]);
			// clk<=1'b0; #1; $display("clk = %b", clk);
		// end
		
		
// end

// //counter c(clk,r, en, cnt);
// counter c(clk, r, en, cnt);
// MSG_SCHr ms(en, wrd_ary, cnt, wrd_ary);
// endmodule




// module cmpr_tb();
// logic [31:0] wt,w_t;
// logic [63:0][31:0] wrd_ary,wrd_ary_2;
// logic [31:0] A, B, C, D, E, F, G, H, _A, _B, _C, _D, _E, _F, _G, _H;
// logic [7:0][31:0] hreg;
// logic clk, r, en =1'b0;
// logic [6:0] cnt;//=6'b0;
// logic [7:0][31:0] iv = '{32'h6a09e667, 32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
// logic [31:0] kt [63:0] = '{32'h428A2F98,32'h71374491,32'hB5C0FBCF,32'hE9B5DBA5,32'h3956C25B,32'h59F111F1,32'h923F82A4,32'hAB1C5ED5,32'hD807AA98,
// 32'h12835B01,32'h243185BE,32'h550C7DC3,32'h72BE5D74,32'h80DEB1FE,32'h9BDC06A7,32'hC19BF174,32'hE49B69C1,32'hEFBE4786,32'h0FC19DC6,32'h240CA1CC,
// 32'h2DE92C6F,32'h4A7484AA,32'h5CB0A9DC,32'h76F988DA,32'h983E5152,32'hA831C66D,32'hB00327C8,32'hBF597FC7,32'hC6E00BF3,32'hD5A79147,32'h06CA6351,
// 32'h14292967,32'h27B70A85,32'h2E1B2138,32'h4D2C6DFC,32'h53380D13,32'h650A7354,32'h766A0ABB,32'h81C2C92E,32'h92722C85,32'hA2BFE8A1,32'hA81A664B,
// 32'hC24B8B70,32'hC76C51A3,32'hD192E819,32'hD6990624,32'hF40E3585,32'h106AA070,32'h19A4C116,32'h1E376C08,32'h2748774C,32'h34B0BCB5,32'h391C0CB3,
// 32'h4ED8AA4A,32'h5B9CCA4F,32'h682E6FF3,32'h748F82EE,32'h78A5636F,32'h84C87814,32'h8CC70208,32'h90BEFFFA,32'hA4506CEB,32'hBEF9A3F7,32'hC67178F2};
// logic [511:0] hdata = 512'b01100001011000100110001110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000;
	
	// initial begin

		// wrd_ary[15]=hdata[31:0];
		// wrd_ary[14]=hdata[63:32];
		// wrd_ary[13]=hdata[95:64];
		// wrd_ary[12]=hdata[127:96];
		// wrd_ary[11]=hdata[159:128];
		// wrd_ary[10]=hdata[191:160];
		// wrd_ary[9]=hdata[223:192];
		// wrd_ary[8]=hdata[255:224];
		// wrd_ary[7]=hdata[287:256];
		// wrd_ary[6]=hdata[319:288];
		// wrd_ary[5]=hdata[351:320];
		// wrd_ary[4]=hdata[383:352];
		// wrd_ary[3]=hdata[415:384];
		// wrd_ary[2]=hdata[447:416];
		// wrd_ary[1]=hdata[479:448];
		// wrd_ary[0]=hdata[511:480];
		
		// H=iv[0];
		// G=iv[1];
		// F=iv[2];
		// E=iv[3];
		// D=iv[4];
		// C=iv[5];
		// B=iv[6];
		// A=iv[7];
		
		// $display("Input = %h" , hdata);
		
		// clk<=1'b0; r<=1'b1; #1;
// //		$display("clk = %b, r = %b, en = %b, counter = %d", clk, r, en, cnt);
		// clk<=1'b0; r<=1'b0; #1;
// //		$display("clk = %b, r = %b, en = %b, counter = %d", clk, r, en, cnt);
// //		$display("clk = %b, counter = %d, wt = %h" , clk, cnt, wrd_ary[cnt]); $display("clk = %b", clk);
		// repeat(64) begin
			// clk<=1'b1; en<=1'b1; #1; 
// //			$display("clk = %b, counter = %d, wt = %h" , clk, cnt, wrd_ary[cnt]);
			// clk<=1'b0; #1; 
// //			$display("clk = %b", clk);
		// end
		// $display("Expected Output = ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad");
		// $display("Compressed Output = %h" ,{hreg[7],hreg[6],hreg[5],hreg[4],hreg[3],hreg[2],hreg[1],hreg[0]});
		
// end

// //counter #(7) c(clk,r, en, cnt);
// counter c(clk, r, en, cnt);
// MSG_SCHr ms(en, wrd_ary, cnt+4'b1111, wrd_ary);
// MSG_CMPr mc(en, (en)?cnt:6'b0, A, B, C, D, E, F, G, H, (en)?wrd_ary[cnt-1]:32'b0, (en)?kt[64-cnt]:32'b0, iv, A, B, C, D, E, F, G, H, hreg);


// endmodule


// module sha256_tb();
// logic [7:0][31:0] hreg;
// logic clk, r, en =1'b0;
// logic [6:0] cnt;
// logic [7:0][31:0] iv  = '{32'h6a09e667, 32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
// logic [31:0] kt [0:63] = '{32'h428A2F98,32'h71374491,32'hB5C0FBCF,32'hE9B5DBA5,32'h3956C25B,32'h59F111F1,32'h923F82A4,32'hAB1C5ED5,32'hD807AA98,
// 32'h12835B01,32'h243185BE,32'h550C7DC3,32'h72BE5D74,32'h80DEB1FE,32'h9BDC06A7,32'hC19BF174,32'hE49B69C1,32'hEFBE4786,32'h0FC19DC6,32'h240CA1CC,
// 32'h2DE92C6F,32'h4A7484AA,32'h5CB0A9DC,32'h76F988DA,32'h983E5152,32'hA831C66D,32'hB00327C8,32'hBF597FC7,32'hC6E00BF3,32'hD5A79147,32'h06CA6351,
// 32'h14292967,32'h27B70A85,32'h2E1B2138,32'h4D2C6DFC,32'h53380D13,32'h650A7354,32'h766A0ABB,32'h81C2C92E,32'h92722C85,32'hA2BFE8A1,32'hA81A664B,
// 32'hC24B8B70,32'hC76C51A3,32'hD192E819,32'hD6990624,32'hF40E3585,32'h106AA070,32'h19A4C116,32'h1E376C08,32'h2748774C,32'h34B0BCB5,32'h391C0CB3,
// 32'h4ED8AA4A,32'h5B9CCA4F,32'h682E6FF3,32'h748F82EE,32'h78A5636F,32'h84C87814,32'h8CC70208,32'h90BEFFFA,32'hA4506CEB,32'hBEF9A3F7,32'hC67178F2};
// logic [511:0] hdata;
	
	// initial begin
		// hdata = 512'b01100001011000100110001110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000;
				
		// $display("Input = %h" , hdata);
		
// //		clk<=1'b0; r<=1'b1; #1;
// ////		$display("clk = %b, r = %b, en = %b, counter = %d", clk, r, en, cnt);
// //		clk<=1'b0; r<=1'b0; #1;
// ////		$display("clk = %b, r = %b, en = %b, counter = %d", clk, r, en, cnt);
// //		$display("clk = %b, counter = %d, wt = %h" , clk, cnt, wrd_ary[cnt]); $display("clk = %b", clk);
		// en<=1'b1;
		// repeat(65) begin
			// clk<=1'b1; #1; 
// //			$display("clk = %b, counter = %d, wt = %h" , clk, cnt, wrd_ary[cnt]);
			// clk<=1'b0; #1; 
// //			$display("clk = %b", clk);
		// end
		// //$display("Expected Output    = ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad");
		// //$display("Compressed Output  = %h" ,{hreg[7],hreg[6],hreg[5],hreg[4],hreg[3],hreg[2],hreg[1],hreg[0]});
		
// end
// always @(hreg) begin
	// if (hreg!=256'b0)begin
		// $display("Expected Output    = ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad");
		// $display("Compressed Output  = %h" ,{hreg[7],hreg[6],hreg[5],hreg[4],hreg[3],hreg[2],hreg[1],hreg[0]});
		// en=1'b0;
	// end
// end

// //counter #(7) c(clk,r, en, cnt);
// counter c(clk, r, en, cnt);
// SHA256 sha(clk,r,en,1'b1,cnt,iv,(en)?kt[cnt]:32'b0, hdata,hreg);

// endmodule


// module dbl_sha256_tb();
// logic [255:0] hreg=256'b0;
// logic clk, r, en =1'b0;
// logic [1023:0] msg;

// logic [639:0] hdata;
	
	// initial begin
		// //hdata = 640'b0000001000000000000000000000000000010111100101110101101110010111110000011000111011010001111101111110001001010101101011011111001010010111010110011001101101010101001100110000111011011010101110000111100000000011110010000001011100000001000000000000000000000000000000000000000000000000000000001000101010010111001010010101101000100111010001111011010011110001101000001011001110010100100011011111001110011001000000110100010011000000111000011001111110100110101100101011100100101011001110100001100111001000111001101011101011011100000101000001011110000111010100110000010110001011001101010001100100000001010111110101001100110011000010000111010101001000;
// //		hdata = 640'b0110000101100010011000111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
		
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011948750833;
		// hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011900000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011901000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011902000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011903000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011904000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011905000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011906000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011907000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011908000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011909000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190A000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190B000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190C000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190D000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190E000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190F000000;
		// //hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011910000000;
		// msg={hdata[639:0],1'b1,373'b0,10'b1010000000};  
		// //$display("Input =        020000007179b5791ce81d7f2e55da2f7995b95533e0ad8b87308c711000000000000000a87992a572744b1f0a3b49d83f9930440c1ef96a2b9bb2a3918c6eabcd417178358B0553535F011948750833");
		// $display("Input =        %h" , hdata);
		// $display("  msg =        %h" , msg);
		
		// $display("data chunk 1 = %h" , msg[1023:512]);
		// //$display("data chunk 1 = %b" , hdata[639:128]);
		// $display("data chunk 2 = %h" , msg[511:0]);
		// //$display("data chunk 2 = %b" , {hdata[127:0],1'b1,383'b0});
		
		
// //		clk<=1'b0; r<=1'b1; #1;
// ////		$display("clk = %b, r = %b, en = %b, counter = %d", clk, r, en, cnt);
// //		clk<=1'b0; r<=1'b0; #1;
// ////		$display("clk = %b, r = %b, en = %b, counter = %d", clk, r, en, cnt);
// ////		$display("clk = %b, counter = %d, wt = %h" , clk, cnt, wrd_ary[cnt]); $display("clk = %b", clk);
// //		clk<=1'b1; #1; clk<=1'b0; en<=1'b1; #1; 
		// repeat(195) begin
			// clk<=1'b1; en<=1'b1; #1;
// //			$display("clk = %b, counter = %d, wt = %h" , clk, cnt, wrd_ary[cnt]);
			// clk<=1'b0; #1; 
// //			$display("clk = %b", clk);
		// end
	
// end
// always @(hreg) begin
	// if (hreg!=256'b0)begin
		// $display("Expected Output    = 0000000000000000e067a478024addfecdc93628978aa52d91fabd4292982a50");
		// $display("Compressed Output  = %h" , hreg);
		// en=1'b0;
	// end
// end

// Dbl_SHA256 dbl_sha(clk, r, 1'b0, en, hdata, hreg);

// endmodule






///--------------------------ECM TEST BENCHES--------------------------------VVVV-----------------------------

module endian_TB();
logic [31:0] ary [7:0] = {32'h00000001,32'h00000002,32'h00000003,32'h0fffe001,32'h00000004,32'h01000000,32'h02000000,32'h03000000};
logic[31:0] val_in, val_out;
logic [3:0] idx;

endian_swap_32b inst0(val_in, val_out);
	initial begin
		for (int j=0; j<7; j=j+1) begin
			idx <=j;
			val_in=ary[j];
			#1;
		end
	end
	
	always @(val_out) begin
		$display("idx: %d 	| Input: %h 	| Output: %h", idx, val_in, val_out);
	end
	
endmodule






module get_vrn_TB();
logic clk, vrsn_updt_clk, en, vrn_cir_complt_flg;
logic [31:0] ary [0:7] = {32'h00000001,32'h00000002,32'h00000003,32'h0fffe001,32'h0ffff001,32'h1fffe000,32'h01000000,32'h02000000};
logic[31:0] crnt_vrsn, vrsn_0, vrsn_1, vrsn_2;
logic [3:0] idx;

assign vrsn_updt_clk = clk && vrn_cir_complt_flg;
get_vrns inst0(clk, en, crnt_vrsn, vrn_cir_complt_flg, vrsn_0, vrsn_1, vrsn_2);

	initial begin
		clk=0; en=1; #1;
		for (int j=0; j<=8; j=j+1) begin
			idx <=j;
			clk=0; #1;
			clk=1; crnt_vrsn<=ary[j]; #1; 

		end
	end


	always @(posedge vrsn_updt_clk)begin
		$display("idx: %d | vrn_cir_complt_flg: %b  |crnt_vrsn: %h   |vrsn_0: %h 	| vrsn_1: %h 	| vrsn_2: %h", idx, vrn_cir_complt_flg, crnt_vrsn, vrsn_0, vrsn_1, vrsn_2);
	end



endmodule
























module inc_nonce_TB();
logic clk, vrsn_updt_clk, en, inc_non_flg_clk, inc_non_flg = 1'b1, non_inc_flg = 1'b1;
logic[31:0] nxt_nonce ,_crnt_nonce;
logic [3:0] idx;

assign inc_non_flg_clk = clk && inc_non_flg && non_inc_flg;

inc_reg_val ins_0(_crnt_nonce,nxt_nonce,non_inc_flg);

	initial begin
		idx = 0;
		_crnt_nonce = 32'h48750833;
		repeat (10) begin
			clk<=1'b1; #1;
			clk<=1'b0; #1;
		end
	end

	always @(posedge non_inc_flg) begin
		$display("idx: %d | non_inc_flg: %b  | _crnt_nonce: %h   | nxt_nonce: %h 	", idx, non_inc_flg, _crnt_nonce, nxt_nonce);
		if (inc_non_flg == 1'b1 && non_inc_flg == 1'b1) begin
			if (4999 >= idx)
				_crnt_nonce <= nxt_nonce;
			else begin 
				#1;
				if (9999 >= idx)
					_crnt_nonce <= nxt_nonce;
			end
			//inc_non_flg <= 1'b0;
			non_inc_flg <= 1'b0;
		end
		idx <= idx + 1;		
	end

endmodule






module calc_target_tb();
//bits from btc exchange data: 535f0119 --endian swap--> 19015F53
//Working reg E on round 61 in sha 2 : e07c2655 --endian swap--> 55267CE0
//Working reg E on round 62 in sha 2 : 78a467e0 --endian swap--> E067A478
//Working reg E on round 63 in sha 2 : fedd4a02 --endian swap--> 024ADDFE

	logic [31:0] bits = 32'h1729d72d;
	logic [255:0] val_out = 256'h00000000 ;
	calc_target inst0(bits,val_out);
	
	always_comb
		$display("val_out : %h" , val_out);
		
	initial begin
	
	$display("bits = 535f0119");
	$display("nonce = 16, Working reg E on round 61 in sha 2 : 1f83d9ab + 55afb7fb = 753391a6 --endian swap--> A6913375");
		if (32'hA6913375 <= 32'h535f0119)
			$display("32'hA6913375 <= 32'h535f0119 = True ");
		else $display("false");
		// if (32'hA6913375 <= 32'h19015F53)
			// $display("32'h00000000 <= 32'h19015F53 = True ");
			
	// $display("Working reg E on round 62 in sha 2 : 9b05688c + dd9eff54 = 78a467e0 --endian swap--> E067A478 ");
		// if (32'hE067A478 <= 32'h535f0119)
			// $display("32'hE067A478 <= 32'h535f0119 = True ");
		
		// if (32'hE067A478 <= 32'h19015F53)
			// $display("32'hE067A478 <= 32'h19015F53 = True ");
			
	end
		
endmodule

































module HashEngine_tb ();


	logic [255:0] hreg=256'b0;
	logic [639:0] hdata;
	logic [31:0] header0 [0:15];
	logic [31:0] data1 [0:15];
	
	logic [31:0] iv[0:7] = '{32'h6a09e667, 32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
	
	logic [31:0] kt [0:63] = '{32'h428A2F98,32'h71374491,32'hB5C0FBCF,32'hE9B5DBA5,32'h3956C25B,32'h59F111F1,32'h923F82A4,32'hAB1C5ED5,32'hD807AA98,
	32'h12835B01,32'h243185BE,32'h550C7DC3,32'h72BE5D74,32'h80DEB1FE,32'h9BDC06A7,32'hC19BF174,32'hE49B69C1,32'hEFBE4786,32'h0FC19DC6,32'h240CA1CC,
	32'h2DE92C6F,32'h4A7484AA,32'h5CB0A9DC,32'h76F988DA,32'h983E5152,32'hA831C66D,32'hB00327C8,32'hBF597FC7,32'hC6E00BF3,32'hD5A79147,32'h06CA6351,
	32'h14292967,32'h27B70A85,32'h2E1B2138,32'h4D2C6DFC,32'h53380D13,32'h650A7354,32'h766A0ABB,32'h81C2C92E,32'h92722C85,32'hA2BFE8A1,32'hA81A664B,
	32'hC24B8B70,32'hC76C51A3,32'hD192E819,32'hD6990624,32'hF40E3585,32'h106AA070,32'h19A4C116,32'h1E376C08,32'h2748774C,32'h34B0BCB5,32'h391C0CB3,
	32'h4ED8AA4A,32'h5B9CCA4F,32'h682E6FF3,32'h748F82EE,32'h78A5636F,32'h84C87814,32'h8CC70208,32'h90BEFFFA,32'hA4506CEB,32'hBEF9A3F7,32'hC67178F2};

	logic clk=0, rst=0, sec_tick=1'b0, en=0, en1=0, _en1=0;
	logic [31:0] kt_, wt, mt, mt0, mt1;
	logic [31:0] wreg_ [0:7];
	
	
	
	
	
	
	
	
	
	
	logic _clk,
		sha_en=0,
		new_data_in,
		non_inc_flg = 1'b0,
		_rst = 1'b0,		  
		rst_cntr = 1'b0,
		clk_en=1'b0,
		inc_non_flg = 1'b0,
		cmpltn_flg_0 = 1'b0,
//		cmpltn_flg_1 = 1'b0,
//		cmpltn_flg_2 = 1'b0,
		blk_fnd_0 = 1'b0,
//		blk_fnd_1 = 1'b0,
//		blk_fnd_2 = 1'b0,
		sec_tick_clk,
		inc_non_flg_clk,
		cmpltn_flg_clk,
		inc_vrn_flg;
		  
	logic [31:0] _ms_0 [0:7];
	logic [31:0] ms_0 [0:7];
		  
	logic [2:0] _blk_fnd = 2'bX;
	logic [5:0] r_cntr = 6'b0;
	logic [31:0] _cr_tme = data1[1];
	logic [31:0] crnt_nonce, _crnt_nonce = data1[3];
	logic [31:0] nxt_nonce=32'b0;
	logic [31:0] _data1 [0:15];
		  
	assign new_data_in = (_data1==data1)?1'b0:1'b1;
	assign _clk = en && clk && clk_en;
	assign sec_tick_clk = _clk && sec_tick;
	assign inc_non_flg_clk = _clk && inc_non_flg && non_inc_flg;
	assign cmpltn_flg_clk = _clk && cmpltn_flg_0; //(cmpltn_flg_0 | cmpltn_flg_1 | cmpltn_flg_2);
	assign blk_fnd =_blk_fnd;
	
	
	inc_reg_val inc_nonce(_crnt_nonce,nxt_nonce,non_inc_flg);
	
	counter counter_inst1 (_clk, rst_cntr, en, r_cntr);
	SHA256 sha_inst0 (_clk, rst, sha_en , r_cntr, iv, kt_, mt0, _ms_0, _en1);
	SCHr #(4'b0,2'b01) scheduler_inst1 (_clk, _rst, en1, r_cntr, mt1, wt);
	HashEngine #(4'b0) he_inst0 (_clk, _rst, en1, sec_tick, r_cntr, iv, kt_, wt, ms_0, blk_fnd_0, cmpltn_flg_0);
	
	
	always @(posedge rst)begin
		rst_cntr <= 1'b1;
		_rst <= 1'b1;
		clk_en<=1'b1;
		sha_en<=1'b1;
		inc_non_flg<=1'b0;
		cmpltn_flg_0<=1'b0;
//		cmpltn_flg_1<=1'b0;
//		cmpltn_flg_2<=1'b0;
		r_cntr <= 6'b0;
		wt<=32'bX;
		mt<=32'bX;
		_crnt_nonce<=_data1[3];
		_cr_tme<=_data1[1];
		_blk_fnd <= 2'b0;
	end
	
	always @(*) begin
		if (rst_cntr == 1'b1) begin
			rst_cntr <= 1'b0;
		end
		if (_rst == 1'b1) begin
			_rst <= 1'b0;
		end
	end
	
	always_comb begin
		mt0<=header0[r_cntr%16];
		mt1<= data1[r_cntr%16];
		kt_ <= kt[r_cntr];
	end

	
	always @(posedge _clk)begin
		if (_en1==1 && r_cntr==63) begin
			ms_0 = _ms_0;
			en1 <= 1'b1;
			sha_en<=0;
			_en1<=0;
			$display("out_hash  = %h" , {_ms_0[0],_ms_0[1],_ms_0[2],_ms_0[3],_ms_0[4],_ms_0[5],_ms_0[6],_ms_0[7]});
			_rst<=1'b1;
			_rst=1'b0;
		end
	end
	
	always @(posedge new_data_in) begin
		_data1 <= data1;
	end
	
	always @(posedge sec_tick_clk)begin
		_cr_tme = _data1[1] + 1'b1;
		_data1[1] = _data1[1] + 1'b1;
	end
	
	//version_nonce_feild + 1
	always @(posedge inc_non_flg_clk) begin
		if (inc_non_flg == 1'b1 && non_inc_flg == 1'b1) begin
			if (nxt_nonce == 32'h00000000) begin
				// nonce over flow: throw version+1 flag
				inc_vrn_flg<=1'b1;
				clk_en<=1'b0;
			end else begin
				rst_cntr <= 1'b1;
				_crnt_nonce <= nxt_nonce;
				_data1[3] <= nxt_nonce;
				crnt_nonce <= _crnt_nonce;
			end
			inc_non_flg <= 1'b0;
			non_inc_flg <= 1'b0;
		end
	end
	
	
	always @(posedge cmpltn_flg_clk ) begin
		$display("cmpltn_flg_clk: %b  |  blk_fnd_0: %b" , cmpltn_flg_clk,blk_fnd_0);
		cmpltn_flg_0<=1'b0;
		if (blk_fnd_0) $display("                                                --->>---- BLOCK FOUND YAY!! ---<<----");
		else $display("                                                --->>---- block NOT found ---<<----");
		//blk_fnd_0<=1'b0;
	end
	
	
	
	
	
	initial begin
		hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011948750833;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553525F011948750833;
		//
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011900000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011901000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011902000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011903000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011904000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011905000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011906000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011907000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011908000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011909000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190A000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190B000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190C000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190D000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190E000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190F000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011910000000;
		//msg={hdata[639:0],1'b1,373'b0,10'b1010000000};  
		//$display("Input =        020000007179b5791ce81d7f2e55da2f7995b95533e0ad8b87308c711000000000000000a87992a572744b1f0a3b49d83f9930440c1ef96a2b9bb2a3918c6eabcd417178358B0553535F011948750833");
		
		assign header0 = '{ hdata[639:608], hdata[607:576], hdata[575:544], hdata[543:512],
							hdata[511:480], hdata[479:448], hdata[447:416], hdata[415:384],
							hdata[383:352], hdata[351:320], hdata[319:288], hdata[287:256],
							hdata[255:224], hdata[223:192], hdata[191:160], hdata[159:128]};
	
		assign data1 = '{ hdata[127:96], hdata[95:64], hdata[63:32], hdata[31:0],
						32'h80000000, 32'h00000000, 32'h00000000, 32'h00000000,
						32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
						32'h00000000, 32'h00000000, 32'h00000000, 32'h00000280 };
		
		$display("Input =        %h" , hdata);
		//$display("  msg =        %h" , msg);
		$display("data chunk 1 = %h" , {header0[0],header0[1],header0[2],header0[3],header0[4],header0[5],header0[6],header0[7],header0[8],header0[9],header0[10],header0[11],header0[12],
											header0[13],header0[14],header0[15]});
		$display("data chunk 2 = %h" , {data1[0],data1[1],data1[2],data1[3],data1[4],data1[5],data1[6],data1[7],data1[8],data1[9],data1[10],data1[11],data1[12],
											data1[13],data1[14],data1[15]});
		$display("");

		clk<=0; rst<=0; en<=0; clk_en<=0; #1;
		rst<=1; #1;
		rst<=0; #1;
		en<=1; clk_en<=1; #1;
		for(int j=0; j<193; j = j + 1) begin
			clk <= 1; #1;
			clk <= 0; #1;
		end
	
	end
	
	
endmodule







module core_sim_tb ();


	logic [255:0] hreg=256'b0;
	logic [639:0] hdata;
	logic [31:0] header0 [0:15];
	logic [31:0] data1 [0:15];
	
	logic [31:0] iv[0:7] = '{32'h6a09e667, 32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
	
	logic [31:0] kt [0:63] = '{32'h428A2F98,32'h71374491,32'hB5C0FBCF,32'hE9B5DBA5,32'h3956C25B,32'h59F111F1,32'h923F82A4,32'hAB1C5ED5,32'hD807AA98,
	32'h12835B01,32'h243185BE,32'h550C7DC3,32'h72BE5D74,32'h80DEB1FE,32'h9BDC06A7,32'hC19BF174,32'hE49B69C1,32'hEFBE4786,32'h0FC19DC6,32'h240CA1CC,
	32'h2DE92C6F,32'h4A7484AA,32'h5CB0A9DC,32'h76F988DA,32'h983E5152,32'hA831C66D,32'hB00327C8,32'hBF597FC7,32'hC6E00BF3,32'hD5A79147,32'h06CA6351,
	32'h14292967,32'h27B70A85,32'h2E1B2138,32'h4D2C6DFC,32'h53380D13,32'h650A7354,32'h766A0ABB,32'h81C2C92E,32'h92722C85,32'hA2BFE8A1,32'hA81A664B,
	32'hC24B8B70,32'hC76C51A3,32'hD192E819,32'hD6990624,32'hF40E3585,32'h106AA070,32'h19A4C116,32'h1E376C08,32'h2748774C,32'h34B0BCB5,32'h391C0CB3,
	32'h4ED8AA4A,32'h5B9CCA4F,32'h682E6FF3,32'h748F82EE,32'h78A5636F,32'h84C87814,32'h8CC70208,32'h90BEFFFA,32'hA4506CEB,32'hBEF9A3F7,32'hC67178F2};

	logic clk=0, rst=0, sec_tick=1'b0, en=0, en1=0, _en1=0;
	logic [31:0] kt_, wt, mt, mt0, mt1;
	logic [31:0] wreg_ [0:7];
		
	
	logic _clk,
		sha_en=0,
		new_data_in,
		non_inc_flg = 1'b0,
		_rst = 1'b0,
		he_rst = 1'b0,
		rst_cntr = 1'b0,
		clk_en=1'b0,
		inc_non_flg = 1'b0,
		cmpltn_flg_0 = 1'b0,
		cmpltn_flg_1 = 1'b0,
		cmpltn_flg_2 = 1'b0,
		blk_fnd_0 = 1'b0,
		blk_fnd_1 = 1'b0,
		blk_fnd_2 = 1'b0,
		sec_tick_clk,
		inc_non_flg_clk,
		cmpltn_flg_clk,
		inc_vrn_flg;
		  
	logic [31:0] _ms_0 [0:7];
	logic [31:0] ms_0 [0:7];
		  
	logic [2:0] _blk_fnd = 2'b0;
	logic [5:0] r_cntr = 6'b0;
	logic [31:0] _cr_tme = data1[1];
	logic [31:0] crnt_nonce, _crnt_nonce = data1[3];
	logic [31:0] nxt_nonce=32'b0;
	logic [31:0] _data1 [0:15];
		  
	assign new_data_in = (_data1==data1)?1'b0:1'b1;
	assign _clk = en && clk && clk_en;
	assign sec_tick_clk = _clk && sec_tick;
	assign inc_non_flg_clk = _clk && inc_non_flg && non_inc_flg;
	assign cmpltn_flg_clk = _clk && cmpltn_flg_0; //(cmpltn_flg_0 | cmpltn_flg_1 | cmpltn_flg_2);
	assign blk_fnd =_blk_fnd;
	
	
	inc_reg_val inc_nonce(_crnt_nonce,nxt_nonce,non_inc_flg);
	
	counter counter_inst1 (_clk, rst_cntr, en, r_cntr);
	SHA256 sha_inst0 (_clk, rst, sha_en , r_cntr, iv, kt_, mt0, _ms_0, _en1);
	SCHr #(4'b0,2'b01) scheduler_inst1 (_clk, _rst, en1, r_cntr, mt1, wt);
	HashEngine #(4'b0) he_inst0 (_clk, he_rst, en1, sec_tick, r_cntr, iv, kt_, wt, ms_0, blk_fnd_0, cmpltn_flg_0);
	
	
	always @(posedge rst)begin
		rst_cntr <= 1'b1;
		_rst <= 1'b1;
		he_rst <= 1'b1;
		clk_en<=1'b1;
		sha_en<=1'b1;
		inc_non_flg<=1'b0;
		cmpltn_flg_0<=1'b0;
		cmpltn_flg_1<=1'b0;
		cmpltn_flg_2<=1'b0;
		r_cntr <= 6'b0;
		wt<=32'bX;
		mt<=32'bX;
		_crnt_nonce<=_data1[3];
		_cr_tme<=_data1[1];
		_blk_fnd <= 2'b0;
	end
	
	always @(*) begin
		if (rst_cntr == 1'b1) begin
			rst_cntr <= 1'b0;
		end
		if (_rst == 1'b1) begin
			_rst <= 1'b0;
		end
		if (he_rst == 1'b1) begin
			he_rst <= 1'b0;
		end
	end
	
	always_comb begin
		mt0<=header0[r_cntr%16];
		mt1<= _data1[r_cntr%16];
		kt_ <= kt[r_cntr];
	end

	
	always @(posedge _clk)begin
		if (_en1==1 && r_cntr==63) begin
			ms_0 = _ms_0;
			en1 <= 1'b1;
			sha_en<=0;
			_en1<=0;
			$display("out_hash  = %h" , {_ms_0[0],_ms_0[1],_ms_0[2],_ms_0[3],_ms_0[4],_ms_0[5],_ms_0[6],_ms_0[7]});
			_rst<=1'b1;
			_rst=1'b0;
			he_rst<=1'b1;
			he_rst=1'b0;
		end
	end
	
	always @(posedge new_data_in) begin
		_data1 = data1;
		$display("_data1: %h ",{_data1[0],_data1[1],_data1[2],_data1[3],_data1[4],_data1[5],_data1[6],_data1[7],_data1[8],_data1[9],_data1[10],_data1[11],_data1[12],
											_data1[13],_data1[14],_data1[15]});
		$display(" data1: %h ",{data1[0],data1[1],data1[2],data1[3],data1[4],data1[5],data1[6],data1[7],data1[8],data1[9],data1[10],data1[11],data1[12],
											data1[13],data1[14],data1[15]});
	end
	
	always @(posedge sec_tick_clk)begin
		_cr_tme = _data1[1] + 1'b1;
		data1[1] = _data1[1] + 1'b1;  /////<<<<------------|| use circuit inc_reg_val for this ||----------------check this logic when in core mod
	end
	
	//version_nonce_feild + 1
	always @(posedge inc_non_flg_clk) begin
		if (inc_non_flg == 1'b1 && non_inc_flg == 1'b1) begin
			if (nxt_nonce == 32'h00000000) begin
				// nonce over flow: throw version+1 flag
				inc_vrn_flg<=1'b1;
				clk_en<=1'b0;
			end else begin
				rst_cntr <= 1'b1;
				$display("iterating nonce:  _crnt_nonce = %h  |  nxt_nonce = %h ",_crnt_nonce,nxt_nonce);
				data1[3] <= nxt_nonce;  /////<<<<----------------------------check this logic when in core mod
				_crnt_nonce = nxt_nonce;
				crnt_nonce <= _crnt_nonce;
				he_rst<=1'b1;
				he_rst=1'b0;
			end
			inc_non_flg <= 1'b0;
			non_inc_flg <= 1'b0;
		end
	end
	
	
	always @(posedge cmpltn_flg_clk ) begin
		if (cmpltn_flg_0 == 1'b1 | cmpltn_flg_1 == 1'b1 | cmpltn_flg_2 == 1'b1) begin
			if({blk_fnd_0,blk_fnd_1,blk_fnd_2} != 3'b000) begin
				en<=1'b0;
				clk_en<=1'b0;
				case({blk_fnd_0,blk_fnd_1,blk_fnd_2})
					3'b001 : begin //if (blk_fnd_0 == 1'b1) begin
							_blk_fnd <= 2'b01;
							cmpltn_flg_0<=1'b0;
						end
					3'b010 : begin //if (blk_fnd_1 == 1'b1) begin
							_blk_fnd <= 2'b10;
							cmpltn_flg_1<=1'b0;
						end 
					3'b100 : begin //if (blk_fnd_2 == 1'b1) begin
							_blk_fnd <= 2'b11;
							cmpltn_flg_2<=1'b0;
						end 
					default : begin //else 
							//_blk_fnd <= 2'b00;
						end
				endcase
			end else begin
				inc_non_flg<=1'b1;
				cmpltn_flg_0<=1'b0;
				cmpltn_flg_1<=1'b0;
				cmpltn_flg_2<=1'b0;;
			end
			
		end
		
	end
	
	
	always @(posedge cmpltn_flg_clk ) begin
		$display("cmpltn_flg_clk: %b  |  blk_fnd_0: %b" , cmpltn_flg_clk,blk_fnd_0);
		cmpltn_flg_0<=1'b0;
		if (blk_fnd_0) $display("                                                --->>---- BLOCK FOUND YAY!! ---<<----");
		else $display("                                                --->>---- block NOT found trying another nonce ---<<----");
		//blk_fnd_0<=1'b0;
	end
	
	
	
	
	
	initial begin
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011948750833;
		hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01193B750833;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553 525F01193B750833; //<<---- messed up time stamp used for other testing
		//
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011900000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011901000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011902000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011903000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011904000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011905000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011906000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011907000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011908000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011909000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190A000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190B000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190C000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190D000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190E000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F01190F000000;
		//hdata = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011910000000;
		//msg={hdata[639:0],1'b1,373'b0,10'b1010000000};  
		//$display("Input =        020000007179b5791ce81d7f2e55da2f7995b95533e0ad8b87308c711000000000000000a87992a572744b1f0a3b49d83f9930440c1ef96a2b9bb2a3918c6eabcd417178358B0553535F011948750833");
		
		header0 = '{ hdata[639:608], hdata[607:576], hdata[575:544], hdata[543:512],
							hdata[511:480], hdata[479:448], hdata[447:416], hdata[415:384],
							hdata[383:352], hdata[351:320], hdata[319:288], hdata[287:256],
							hdata[255:224], hdata[223:192], hdata[191:160], hdata[159:128]};
	
		data1 = '{ hdata[127:96], hdata[95:64], hdata[63:32], hdata[31:0],
						32'h80000000, 32'h00000000, 32'h00000000, 32'h00000000,
						32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
						32'h00000000, 32'h00000000, 32'h00000000, 32'h00000280 };
		
		$display("Input =        %h" , hdata);
		//$display("  msg =        %h" , msg);
		$display("data chunk 1 = %h" , {header0[0],header0[1],header0[2],header0[3],header0[4],header0[5],header0[6],header0[7],header0[8],header0[9],header0[10],header0[11],header0[12],
											header0[13],header0[14],header0[15]});
		$display("data chunk 2 = %h" , {data1[0],data1[1],data1[2],data1[3],data1[4],data1[5],data1[6],data1[7],data1[8],data1[9],data1[10],data1[11],data1[12],
											data1[13],data1[14],data1[15]});
		$display("");

		clk<=0; rst<=0; en<=0; clk_en<=0; #1;
		rst<=1; #1;
		rst<=0; #1;
		en<=1; clk_en<=1; #1;
		// for(int j=0; j<4999; j = j + 1) begin
			// clk <= 1; #1;
			// clk <= 0; #1;
		// end
		while (_blk_fnd==2'b00)begin
			if(32'h48750833 >= _crnt_nonce) begin
				clk <= 1; #1;
				clk <= 0; #1;
			end else begin
				_blk_fnd=2'b01;
				$display("");
				$display("---->>>>>--------***********---------<<<<<---");
				$display("Exiting while loop" );
				$display("---->>>>>--------***********---------<<<<<---");
				$display("");
				clk=1'b0; #10000000;
			end
		end
		$display("");
		$display("---->>>>>--------***********---------<<<<<---");
		$display("Jumped out of while loop and about to exit initial block");
		$display("---->>>>>--------***********---------<<<<<---");
		$display("");
	end
	
	
endmodule


























module core_tb ();

logic system_clk;
logic[639:0] blk_hdr;
logic vrn_ovr_flw_flg, blk_fnd_flg_out;
logic [31:0] vrsn_out, tme_out, non_out;



	logic [31:0] data0 [0:15];
	logic [31:0] data1 [0:15];
	
	logic [31:0] iv[0:7] = '{32'h6a09e667, 32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
	
	logic [31:0] kt [0:63] = '{32'h428A2F98,32'h71374491,32'hB5C0FBCF,32'hE9B5DBA5,32'h3956C25B,32'h59F111F1,32'h923F82A4,32'hAB1C5ED5,32'hD807AA98,
	32'h12835B01,32'h243185BE,32'h550C7DC3,32'h72BE5D74,32'h80DEB1FE,32'h9BDC06A7,32'hC19BF174,32'hE49B69C1,32'hEFBE4786,32'h0FC19DC6,32'h240CA1CC,
	32'h2DE92C6F,32'h4A7484AA,32'h5CB0A9DC,32'h76F988DA,32'h983E5152,32'hA831C66D,32'hB00327C8,32'hBF597FC7,32'hC6E00BF3,32'hD5A79147,32'h06CA6351,
	32'h14292967,32'h27B70A85,32'h2E1B2138,32'h4D2C6DFC,32'h53380D13,32'h650A7354,32'h766A0ABB,32'h81C2C92E,32'h92722C85,32'hA2BFE8A1,32'hA81A664B,
	32'hC24B8B70,32'hC76C51A3,32'hD192E819,32'hD6990624,32'hF40E3585,32'h106AA070,32'h19A4C116,32'h1E376C08,32'h2748774C,32'h34B0BCB5,32'h391C0CB3,
	32'h4ED8AA4A,32'h5B9CCA4F,32'h682E6FF3,32'h748F82EE,32'h78A5636F,32'h84C87814,32'h8CC70208,32'h90BEFFFA,32'hA4506CEB,32'hBEF9A3F7,32'hC67178F2};

	
	logic rst=1'b1,
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
		  vrsn_inc_clk;
	
	logic [2:0] blk_fnd = 2'b00;
	logic [5:0] r_cntr = 6'b000000;

	logic [31:0] cr_tme = 32'h00000000,
				 crnt_nonce = 32'h00000000,
				 vrsn2 = 32'h00000000,
				 vrsn1 = 32'h00000000,
				 vrsn0 = 32'h00000000,
				 vrsn = data0[0],
				 shdw_vrsn = data0[0],
				 tme = data1[1],
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
	assign vrsn_updt_clk = clk && vrn_cir_complt_flg;	  
	//assign calc_ms_clk = clk && (ms_0_en || ms_1_en || ms_2_en); //&& r_cntr
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
	
	
//	SCHr scheduler_inst0 (clk, rst, ms_0_en, r_cntr, mt0_, wt);
//	CMPr compressor_inst0 (clk, rst, ms_0_en, r_cntr, iv_, kt, wt, ms_0, validOut_0);
//	
//	SCHr scheduler_inst1 (clk, rst, ms_1_en, r_cntr, mt1_, wt);
//	CMPr compressor_inst1 (clk, rst, ms_1_en, r_cntr, iv_, kt, wt, ms_1, validOut_1);
//	
//	SCHr scheduler_inst2 (clk, rst, ms_2_en, r_cntr, mt2_, wt);
//	CMPr compressor_inst2 (clk, rst, ms_2_en, r_cntr, iv_, kt, wt, ms_2, validOut_2);
//----------pre-processing functions ---- end	
	
	Core core_inst0(clk, rst, core_en, sec_tick, iv, kt, data1, _ms_0, _ms_1, _ms_2,  cr_tme, crnt_nonce, blk_fnd, inc_vrn_flg);
		
	always @(posedge iniztn_cmpltd_clk)begin
		rst<=1'b0;
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
		//iniztn_cmpltd_clk <= 1'b0;
		//core_en_clk <= 1'b0;
		//vrsn_inc_clk <= 1'b0;
		//vrsn_updt_clk <= 1'b0;
		//calc_ms_clk <= 1'b0;
		//chk_core_otpts <= 1'b0;
		blk_fnd <= 2'b00;
		r_cntr <= 6'b000000;
		cr_tme <= 32'h00000000;
		crnt_nonce <= 32'h00000000;
		vrsn2 <= 32'h00000000;
		vrsn1 <= 32'h00000000;
		vrsn0 <= 32'h00000000;
		//vrsn <= data0[0];
		//shdw_vrsn <= data0[0];
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
		data_1 [0:15] <= data0;
		data_2 [0:15] <= data0;
		clk_en <= 1'b1;
//		data_1[0]=vrsn1;
//		data_2[0]=vrsn2;
		$display("initialization completed" );
	end
	
	always @(posedge system_clk or negedge system_clk)begin
		if (clk_en == 1'b1) begin
			clk <= system_clk;
			//non_out <= crnt_nonce;
		end
	end
	
//	always @(negedge system_clk)begin
//		if (clk_en == 1'b1) begin
//			clk <= system_clk;
//			//non_out <= crnt_nonce;
//		end
//	end
	
	always_comb begin
		kt_ <= kt[r_cntr];
	end
	
	
	//when the blcok header changes from UART reset all downstream devices
	always @( blk_hdr) begin
		//reset everything
		rst<=1'b1;
		vrsn = data0[0];
		shdw_vrsn = data0[0];
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
		//if(inc_vrn_flg_== 1'b1) begin
			vrsn <= shdw_vrsn[28:13] + 1'b1;
			rst <= 1'b1;
		//end
		inc_vrn_flg_ <= 1'b0;
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
		end else begin //if (inc_vrn_flg = 1'b1)begin // vrsn +1
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
		end
		if(vrsn1 != 32'h00000000)begin
			data_1[0]=vrsn1;
			ms_1_en = 1'b1;
		end
		if(vrsn2 != 32'h00000000)begin
			data_2[0]=vrsn2;
			ms_2_en = 1'b1;
		end
		if({ms_0_en,ms_1_en,ms_2_en} == 3'b000)begin
			vrn_ovr_flw_flg<=1'b1;
		end else cntr_en = 1'b1;
		vrn_cir_complt_flg<=1'b0;
		vrsn_en<=1'b0;
	end
	
//	always @(posedge calc_ms_clk) begin
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
	

	
	initial begin
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011948750833;
		blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011941750833; // <<---- nonce as been adjusted so nonce = nonce_blk_fnd - 8 (meaning 7 nonce+1 then blk_fnd)
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
		//msg={blk_hdr[639:0],1'b1,373'b0,10'b1010000000};  
		//$display("Input =        020000007179b5791ce81d7f2e55da2f7995b95533e0ad8b87308c711000000000000000a87992a572744b1f0a3b49d83f9930440c1ef96a2b9bb2a3918c6eabcd417178358B0553535F011948750833");
		
		data0 = '{ blk_hdr[639:608], blk_hdr[607:576], blk_hdr[575:544], blk_hdr[543:512],
							blk_hdr[511:480], blk_hdr[479:448], blk_hdr[447:416], blk_hdr[415:384],
							blk_hdr[383:352], blk_hdr[351:320], blk_hdr[319:288], blk_hdr[287:256],
							blk_hdr[255:224], blk_hdr[223:192], blk_hdr[191:160], blk_hdr[159:128]};
	
		data1 = '{ blk_hdr[127:96], blk_hdr[95:64], blk_hdr[63:32], blk_hdr[31:0],
						32'h80000000, 32'h00000000, 32'h00000000, 32'h00000000,
						32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
						32'h00000000, 32'h00000000, 32'h00000000, 32'h00000280 };
		
		$display("Input =        %h" , blk_hdr);
		//$display("  msg =        %h" , msg);
		$display("data chunk 1 = %h" , {data0[0],data0[1],data0[2],data0[3],data0[4],data0[5],data0[6],data0[7],data0[8],data0[9],data0[10],data0[11],data0[12],
											data0[13],data0[14],data0[15]});
		$display("data chunk 2 = %h" , {data1[0],data1[1],data1[2],data1[3],data1[4],data1[5],data1[6],data1[7],data1[8],data1[9],data1[10],data1[11],data1[12],
											data1[13],data1[14],data1[15]});
		$display("");

		system_clk<=0; 
		crnt_nonce<=32'h00000000;
		#1;
//		rst<=0; #1;
//		rst<=1; #1;
//		rst<=0; #1;
		// for(int j=0; j<4999; j = j + 1) begin
			// clk <= 1; #1;
			// clk <= 0; #1;
		// end
		
		$display("system_clk: %b  |  blk_fnd: %b  | crnt_nonce: %h",system_clk,blk_fnd,crnt_nonce);
		while (blk_fnd==2'b00)begin
			if(32'h4A750833 >= crnt_nonce) begin
				system_clk <= 1; #1;
				system_clk <= 0; #1;
			end else begin
				blk_fnd=2'b01;
				$display("");
				$display("");
				$display("---->>>>>--------***********---------<<<<<---");
				$display("Forced Exiting of while loop" );
				$display("---->>>>>--------***********---------<<<<<---");
				$display("");
				clk=1'b0; #10000000;
			end
		end
		$display("");
		$display("---->>>>>--------***********---------<<<<<---");
		$display("Jumped out of while loop and about to exit initial block");
		$display("---->>>>>--------***********---------<<<<<---");
		$display("");
	end
	
	
endmodule




module ECM_tb ();

logic system_clk;
logic[639:0] blk_hdr;
logic vrn_ovr_flw_flg, blk_fnd_flg_out;
logic [31:0] vrsn_out, tme_out, non_out, non_out_1;

	logic [31:0] data0 [0:15];
	logic [31:0] data1 [0:15];


	ECM inst_0(system_clk, blk_hdr, vrn_ovr_flw_flg, blk_fnd_flg_out, vrsn_out, tme_out, non_out );

	always @(non_out)
		non_out_1=non_out;
	
	always @(blk_fnd_flg_out) begin
		$display("");
		$display("---->>>>>--------****** ECM Test Bench ******---------<<<<<---");
		$display("");
		$display("system_clk: %b",system_clk);
		$display("blk_hdr: %h",blk_hdr);
		$display("vrn_ovr_flw_flg: %b ",vrn_ovr_flw_flg);
		$display("blk_fnd_flg_out: %b",blk_fnd_flg_out);
		$display("vrsn_out: %h",vrsn_out);
		$display("tme_out: %h",tme_out);
		$display("non_out: %h",non_out);
		$display("");
		$display("---->>>>>--------****** ECM Test Bench ******---------<<<<<---");
		$display("");
	end

initial begin
		//blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011948750833;
		blk_hdr = 640'h0200000017975B97C18ED1F7E255ADF297599B55330EDAB87803C81701000000000000008A97295A2747B4F1A0B3948DF3990344C0E19FA6B2B92B3A19C8E6BADC141787358B0553535F011941750833; // <<---- nonce as been adjusted so nonce = nonce_blk_fnd - 8 (meaning 7 nonce+1 then blk_fnd)
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
		//msg={blk_hdr[639:0],1'b1,373'b0,10'b1010000000};  
		//$display("Input =        020000007179b5791ce81d7f2e55da2f7995b95533e0ad8b87308c711000000000000000a87992a572744b1f0a3b49d83f9930440c1ef96a2b9bb2a3918c6eabcd417178358B0553535F011948750833");
		
		data0 = '{ blk_hdr[639:608], blk_hdr[607:576], blk_hdr[575:544], blk_hdr[543:512],
							blk_hdr[511:480], blk_hdr[479:448], blk_hdr[447:416], blk_hdr[415:384],
							blk_hdr[383:352], blk_hdr[351:320], blk_hdr[319:288], blk_hdr[287:256],
							blk_hdr[255:224], blk_hdr[223:192], blk_hdr[191:160], blk_hdr[159:128]};
	
		data1 = '{ blk_hdr[127:96], blk_hdr[95:64], blk_hdr[63:32], blk_hdr[31:0],
						32'h80000000, 32'h00000000, 32'h00000000, 32'h00000000,
						32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
						32'h00000000, 32'h00000000, 32'h00000000, 32'h00000280 };
						
		vrn_ovr_flw_flg=1'b0;
		blk_fnd_flg_out=1'b0;
		vrsn_out=32'h00000000;
		tme_out=32'h00000000;
		non_out=32'h00000000;
		
		$display("Input =        %h" , blk_hdr);
		//$display("  msg =        %h" , msg);
		$display("data chunk 1 = %h" , {data0[0],data0[1],data0[2],data0[3],data0[4],data0[5],data0[6],data0[7],data0[8],data0[9],data0[10],data0[11],data0[12],
											data0[13],data0[14],data0[15]});
		$display("data chunk 2 = %h" , {data1[0],data1[1],data1[2],data1[3],data1[4],data1[5],data1[6],data1[7],data1[8],data1[9],data1[10],data1[11],data1[12],
											data1[13],data1[14],data1[15]});
		$display("");

		system_clk <= 0; #1;
		system_clk <= 1; #1;
//		crnt_nonce<=32'h00000000;
//		#1;
//		rst<=0; #1;
//		rst<=1; #1;
//		rst<=0; #1;
		// for(int j=0; j<4999; j = j + 1) begin
			// clk <= 1; #1;
			// clk <= 0; #1;
		// end
		
		$display("system_clk: %b  |  blk_fnd_flg_out: %b  | crnt_nonce: %h",system_clk,blk_fnd_flg_out,non_out_1);
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
		$display("");
		$display("---->>>>>--------***********---------<<<<<---");
		$display("Jumped out of while loop and about to exit initial block");
		$display("---->>>>>--------***********---------<<<<<---");
		$display("");
	end


endmodule




































