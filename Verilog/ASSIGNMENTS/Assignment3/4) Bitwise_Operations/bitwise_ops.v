module bitwise_ops (
	input  [3:0] x,
	input  [3:0] y,
	output [3:0] not_x,
	output [3:0] and_xy,
	output [3:0] or_xy,
	output [3:0] xor_xy,
	output [3:0] xnor_xy
);


  assign not_x  = ~x;
  assign and_xy = x & y;
  assign or_xy  = x | y;
  assign xor_xy = x ^ y;
  assign xnor_xy = x ^~ y; 

endmodule



