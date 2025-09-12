module flag_logic (
	input  wire f1,
	input  wire f2,
	input  wire f3,
	output reg  out
);
	always @(*) begin
		if (f1)
			out = 1'b1;
		else if (f2)
			out = 1'b0;
		else if (f3)
			out = 1'b1;
		else
			out = 1'bz;
	end
endmodule

