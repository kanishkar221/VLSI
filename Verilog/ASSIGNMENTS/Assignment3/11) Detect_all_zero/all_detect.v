module all_detect#(parameter N = 9) (
	input [N - 1:0] x,
	output zero, 
	output one
);
	assign zero = ~(|x);
	assign one  = &x;

endmodule


	

