module full_subtractor( input A, input B, input Bin, output Diff, output Bout);
	wire x1, x2, x3;
	xor (x1, A, B);
	xor (Diff, x1, Bin);
	and (x2, ~A, B);
	and (x3, ~x1, Bin);
	or  (Bout, x2, x3);

endmodule


