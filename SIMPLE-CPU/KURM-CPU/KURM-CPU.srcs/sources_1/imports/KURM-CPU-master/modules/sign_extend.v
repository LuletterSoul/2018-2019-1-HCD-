module sign_extend4_to_16(in, out);
	input [3:0] in;
	output reg [15:0] out;
	always @(in)
	begin
		out[3:0] = in[3:0];
		out[15:4] = {in[3], in[3], in[3], in[3], in[3], in[3], in[3], in[3], in[3], in[3], in[3], in[3]};
	end
endmodule
