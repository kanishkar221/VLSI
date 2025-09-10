module toggle(
	output reg out
);

	initial begin
		out = 1'b0;
	end
	always begin
		#5 out = ~out;
	end
endmodule

