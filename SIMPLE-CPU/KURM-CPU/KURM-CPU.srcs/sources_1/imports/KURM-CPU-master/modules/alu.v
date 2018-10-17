module alu(x, y, z, c_in, c_out, lt, eq, gt, overflow, c);
	input [15:0] x, y;
	input [2:0] c;
	input c_in;
	
	output reg [15:0] z;
	output reg c_out, lt, eq, gt, overflow;
	
	always @(c, x, y, c_in)
	begin
		case (c)
			3'b000 : z = x & y; 					//And
			3'b001 : z = x | y; 					//Or
			3'b010 : begin
						{c_out, z} = x + y + c_in; 	//Add
						overflow = (x[15] == y[15]) && (z[15] != x[15]); //setting overflow bit
					end	
			3'b011 : begin
						{c_out, z} = x + ~y + 1; 	//Subtract
						overflow = (x[15] != y[15]) && (z[15] != x[15]); //setting overflow bit
					end	
			3'b111 : z = x < y; 					//Set-on-less-than
		endcase
		
		lt = x < y;		//less than (is x < y?)
		eq = x == y;	//equal (is x = y?)
		gt = x > y;		//greater than (is x > y?)
	end
endmodule