module comparator #
(
	parameter WIDTH = 8
)
(
	input  wire [WIDTH-1:0] a,
	input  wire [WIDTH-1:0] b,
	output reg  eq,   // a == b
	output reg  lt,   // a <  b
	output reg  gt    // a >  b
);
	always @(*) begin
	       if (a == b) begin
        		  eq = 1'b1; lt = 1'b0; gt = 1'b0;
	       end
        else if (a < b) begin
       			  eq = 1'b0; lt = 1'b1; gt = 1'b0;
	       end
        else begin
       			  eq = 1'b0; lt = 1'b0; gt = 1'b1;
	       end
	end

endmodule

