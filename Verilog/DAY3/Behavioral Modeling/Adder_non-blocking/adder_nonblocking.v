module adder_nonblocking (
	input  [1:0] a,
	input  [1:0] b,
	output reg [2:0] sum
);
	always @(*) begin
        sum <= a + b;
	end
endmodule


