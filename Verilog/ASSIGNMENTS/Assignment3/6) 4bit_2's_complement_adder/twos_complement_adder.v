module twos_complement_adder(
	input x,  
	input y,  
	input c_in,     
	output sum, 
	output c_out      
);
	wire [3:0] t;

	assign t = y ^ {4{c_in}};  

        assign {c_out, sum} = x + t + c_in;  

endmodule


