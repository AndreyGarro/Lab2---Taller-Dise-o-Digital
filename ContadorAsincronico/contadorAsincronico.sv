module contadorAsincronico(nBits, clk, rst, disp);

	input wire [5:0] nBits;
	input wire clk;
	input wire rst;
	output reg [13:0] disp;
	
	wire [5:0] cantFF;
	reg [7:0] num;
	assign num[6+:2] = 2'b00;
	
	analizadorBits analyzer(
		.ent(nBits),
		.sal(cantFF));
	
	contador cont(
		.cantFF(cantFF),
		.clk(clk),
		.rst(rst),
		.num(num[0+:6]));
	
	hex7seg disp1(
		.display(disp[0+:7]),
		.inputHex(num[0+:4]),
		.enable(1));
	
	hex7seg disp2(
		.display(disp[7+:7]),
		.inputHex(num[4+:4]),
		.enable(1));
	
endmodule
