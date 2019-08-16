module analizadorBits(ent, sal);
	
	input wire [5:0] ent;
	output reg [6:0] sal;
	
	always @(ent) begin
		sal = ent;
		for(int i = 0; i < 5; i++) begin
			if(ent[i+:2] == 2'b10) begin
				sal = 6'b000000;
				break;
			end
		end
	end
	
endmodule