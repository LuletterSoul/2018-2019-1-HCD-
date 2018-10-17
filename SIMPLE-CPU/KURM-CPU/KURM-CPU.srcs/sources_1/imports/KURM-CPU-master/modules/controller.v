module controller(Op_code, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
	input [3:0] Op_code;
	output reg RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
	output reg [2:0] ALUOp; //this is to be directly connected to the ALU control input
							//000 - AND, 
							//001 - OR, 
							//010 - ADD, 
							//011 - SUB, 
							//111 - SET_ON_LESS_THAN
	
	always @(Op_code)
	begin
		case (Op_code)
			//MOV instruction
		    4'd3 : {RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} = 11'b00000010011; 
			//ADD instruction
			4'd2 : {RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} = 11'b10000010001;
			//SUB instruction 
			4'd6 : {RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} = 11'b10000011001; 
			//AND instruction
			4'd0 : {RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} = 11'b10000000001; 
			//OR instruction
			4'd1 : {RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} = 11'b10000001001; 
			//SLT instruction
			4'd7 : {RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} = 11'b10000111001; 
			//LW instruction
			4'd8 : {RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} = 11'b00011010011; 
			//SW instruction
			4'd10 : {RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} =11'b00000010110; 
			//BNE instruction
			4'd14 : {RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} =11'b00100011000; 
			//JMP instruction
			4'd15 : {RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} =11'b01000000000; 
			default : $display("Invalid signal");
		endcase
	end
endmodule

               