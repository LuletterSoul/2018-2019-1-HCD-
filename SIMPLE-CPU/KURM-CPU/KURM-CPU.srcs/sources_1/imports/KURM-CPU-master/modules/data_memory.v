module data_memory(addr, memRead, memWrite, writeData, clock, readData);
	input [15:0] addr;
	input [15:0] writeData;
	input memRead, memWrite, clock;
	
	output reg [15:0] readData;

	reg [15:0] memory [1023:0]; //this memory is word addresseble (each word is 16 bits)

	initial
	begin
	$readmemh("data.mem", memory);	      
//	memory[0] = 16'd2;
//	memory[1] = 16'd10;
	end
	
	always @ (posedge clock) 
		begin
			if (memWrite == 1) 
				memory[addr] <= writeData;

			if (memRead == 1) 
				readData <= memory[addr];
		end

endmodule