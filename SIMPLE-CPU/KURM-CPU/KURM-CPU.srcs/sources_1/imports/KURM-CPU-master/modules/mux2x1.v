module mux2_to_1 (out, i0, i1, s);
	
	input [15:0] i0, i1;
	input s;

	output reg [15:0] out;
	
	initial 
		out = 16'd0;
		
	always @(s, i0, i1)
	begin	
	
		case (s)
			1'b0 : out = i0;
			1'b1 : out = i1;
			default : $display("Invalid signal");	
		endcase
	end	
	
endmodule
