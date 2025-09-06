module decoder(
	input  [1:0] a,   
	output [3:0] y    
);

	assign y[0] = (a == 2'b00);
	assign y[1] = (a == 2'b01);	
	assign y[2] = (a == 2'b10);
	assign y[3] = (a == 2'b11);
endmodule







