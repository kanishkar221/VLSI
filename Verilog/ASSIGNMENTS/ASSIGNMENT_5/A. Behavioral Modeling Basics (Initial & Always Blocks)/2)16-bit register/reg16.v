module reg16(
	output reg [15:0] out
);
	initial begin
		out = 16'h0000;
	end

	always begin
		#10 out = out + 1;
	end

endmodule

