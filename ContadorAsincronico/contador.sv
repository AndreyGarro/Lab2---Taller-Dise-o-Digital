module contador(cantFF, clk, rst, num);
	
	input wire [5:0] cantFF;
	input wire clk;
	input wire rst;
	output reg [5:0] num;
	
	flipflopJK ff0(
		.j(1),
		.k(1),
		.ena(cantFF[0]),
		.rst(rst),
		.clk(clk),
		.q(num[0]));

	flipflopJK ff1(
		.j(1),
		.k(1),
		.ena(cantFF[1]),
		.rst(rst),
		.clk(num[0]),
		.q(num[1]));
		
	flipflopJK ff2(
		.j(1),
		.k(1),
		.ena(cantFF[2]),
		.rst(rst),
		.clk(num[1]),
		.q(num[2]));
		
	flipflopJK ff3(
		.j(1),
		.k(1),
		.ena(cantFF[3]),
		.rst(rst),
		.clk(num[2]),
		.q(num[3]));
		
	flipflopJK ff4(
		.j(1),
		.k(1),
		.ena(cantFF[4]),
		.rst(rst),
		.clk(num[3]),
		.q(num[4]));
		
	flipflopJK ff5(
		.j(1),
		.k(1),
		.ena(cantFF[5]),
		.rst(rst),
		.clk(num[4]),
		.q(num[5]));
	
		
endmodule
