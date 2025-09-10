module comparator_signed #
(
	parameter WIDTH = 8
)
(
	input  wire [WIDTH-1:0] a,
	input  wire [WIDTH-1:0] b,
	output reg  eq,
	output reg  lt,
	output reg  gt
);
	always @(*) begin
	       if ($signed(a) == $signed(b)) begin
		          eq = 1'b1; lt = 1'b0; gt = 1'b0;
	       end
        else if ($signed(a) < $signed(b)) begin
	           eq = 1'b0; lt = 1'b1; gt = 1'b0;
	       end
        else begin
	           eq = 1'b0; lt = 1'b0; gt = 1'b1;
        end
    end

endmodule

