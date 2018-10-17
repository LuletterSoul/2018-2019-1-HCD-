module reg_file(A, B, Aaddr, Baddr, C, Caddr, load, clear, clk);
	input [3:0] Aaddr, Baddr, Caddr;
	input [15:0] C;
	input load, clear, clk;
	output reg [15:0] A, B;

	reg [15:0] regdata [15:0];

	integer i;
	
	initial
	begin
	i = 0;
    for (i = 0;  i < 16; i = i + 1) 
        regdata[i] = 16'd0;
		#2 regdata[0] = 16'd5;
		regdata[1] = 16'd7;
		regdata[12] = 16'd10;
	end
	always
	  #1  regdata[15] = 16'd0; //Con Zero Register
	// write
    always @ (posedge clk) begin
        if (load == 1) 
        regdata[Caddr] = C;   
        end
	always @ (posedge clk) 
        begin


//            if (clear == 0) 
//                begin
//                    i = 0;
//                    for (i = 0;  i < 16; i = i + 1) 
//                        regdata[i] = 16'd0;
//                end

            A <= regdata[Aaddr]; 
            B <= regdata[Baddr];
        end
endmodule