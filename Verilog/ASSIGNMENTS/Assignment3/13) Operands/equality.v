module equality(
	input  [3:0] a, b,
	output       y_case, y_logic
);

	assign y_case  = (a === b);

	assign y_logic = (a == b);
endmodule

