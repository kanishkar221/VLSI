module comparator_func(
	input  [3:0] a, b,
	output reg lt, eq, gt
);

	function [2:0] compare;
		input [3:0] x, y;
		begin
			if (x < y)
				compare = 3'b100;
			else if (x == y)
             			compare = 3'b010; 
       			else
             			compare = 3'b001; 
  		end
	endfunction

	always @(*) begin
		 {lt, eq, gt} = compare(a, b);
		 end

endmodule

