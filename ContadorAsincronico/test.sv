module test ();
	
	logic [5:0] nBits;
	logic clk;
	logic rst;
	reg [13:0] disp;
	
	contadorAsincronico dut(nBits, clk, rst, disp);
	
	initial begin
	
		#10 clk = 1; nBits = 6'b111111; rst = 1;
		#10 clk = 0; rst = 0;
		#10 clk = 1; 
		#10 clk = 0; 
		#10 clk = 1; 
		#10 clk = 0;
		#10 clk = 1; 
		#10 clk = 0; 
		#10 clk = 1; 
		#10 clk = 0; 
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1; 
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0; 
		#10 clk = 1; 
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1; 
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1; 
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		
		
	end
	
endmodule