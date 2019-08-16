module deco_hex7seg_test();

	wire [6:0] display;
	reg [3:0] inputHex;
	reg enable;
	int x;

	hex7seg DUT(display, inputHex, enable);

	initial begin

		enable = 1; inputHex = 0;
		
		for (x=1; x<16; x=x+1)
			#10 inputHex = x;
		
		#10 enable = 0;
	end

endmodule
