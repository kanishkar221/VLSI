module adder_delay (a, b, sum);
	input  [3:0] a, b;
	output [4:0] sum;      
	assign #5 sum = a + b;
endmodule

