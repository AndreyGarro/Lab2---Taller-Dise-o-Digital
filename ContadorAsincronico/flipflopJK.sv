module flipflopJK(j, k, ena, rst, clk, q);

	input wire j;
	input wire k;
	input wire ena;
	input wire rst;
	input wire clk;
	output reg q;
	
	always@(negedge clk or posedge rst or negedge ena) begin
		
		if(rst | ~ena)
			q = 0;
		
		else begin
			if(j == 0 & k == 1)
				q = 0;
			else if (j == 1 & k == 0)
				q = 1;
			else if (j == 1 & k == 1)
				q = ~q;
		end
		
	end

endmodule