module comparator #(parameter N = 9) (
	input  [N-1:0] a,
	input  [N-1:0] b,
	output        ceq, 
	output        clt, 
	output        cgt  
);

	assign ceq = (a == b);
	assign clt = (a <  b);
	assign cgt = (a >  b);

endmodule

