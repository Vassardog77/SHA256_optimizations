module clock_unit(input system_clk, r, output logic sec_tick);
logic sec_clk;
	Clock_Tick clocktick(system_clk, r, sec_tick);
	// Clock_Tick clocktick(system_clk, r, sec_clk);
	// cnt_to_60 seconds(sec_clk, r, sec_tick);
endmodule

module Clock_Tick(input clk_in, r, output logic clk_out);
logic[25:0] cnt;
always_ff @(posedge clk_in or posedge r) begin
	if(r==1)begin
		cnt = 26'd0;
		clk_out = 1'b1;
		end
	else begin
		cnt = cnt + 1'b1 ;
		if(cnt == 26'd25000000) begin
			clk_out = 1'b1; //~clk_out;
			cnt = 26'd0;
		end else begin
			clk_out = 1'b0;
		end
	end
end
endmodule

module cnt_to_60(input clk_in, r, output logic clk_tick);
logic [7:0] count;
	
always_ff @(posedge clk_in or posedge r ) begin
	if(r == 1) begin
		count<=8'b0;
		clk_tick <= 1'b0;
	end else if(count == 8'h59) begin
		count <= 8'b0;
		clk_tick <= 1'b1;
	end else begin
		clk_tick <= 1'b0;
		count = count + 1'b1;
	end
end
endmodule