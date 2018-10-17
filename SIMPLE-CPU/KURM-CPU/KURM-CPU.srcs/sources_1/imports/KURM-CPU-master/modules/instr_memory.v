module instr_memory(addr, clock, instruction);
	input [15:0] addr;
	input clock;
	output reg [15:0] instruction;

	reg [7:0] memory [1023:0]; //this memory is byte addressable 

	//loading some instructions
	initial
	begin
		$readmemh("instructions.mem", memory);	   
	end
	
	always @ (posedge clock) 
	begin
		//two bytes are read from the memory to get the complete instruction
		instruction <= {memory[addr], memory[addr + 1]}; 
	end

endmodule