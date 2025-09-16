module DLatch_async(
	input wire d,
	input wire en,
	input wire reset,
	output reg q
);
	always @(*) begin
		if (reset)
			q = 1'b0;
		else if (en)
			q = d;
	end
endmodule

