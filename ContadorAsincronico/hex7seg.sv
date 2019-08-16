module hex7seg(display, inputHex, enable);

output [6:0] display;

input [3:0] inputHex;

input enable;

deco_7 deco(display, inputHex, enable);

endmodule