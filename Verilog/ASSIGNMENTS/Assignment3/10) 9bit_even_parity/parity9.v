module parity9 (
	input  [8:0] x,
	output ep, 
	output op 
	);

	assign ep = ^x;
	assign op = ~ep;
endmodule


