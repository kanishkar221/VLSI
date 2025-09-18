module shift_right;

	reg [7:0] num;
	reg [2:0] n;        
	reg [7:0] shifted;

	function [7:0] shift_right_n;
		input [7:0] x;
		input [2:0] s;
		begin
          		shift_right_n = x >> s;   
   		end
	endfunction

	initial begin
		$monitor("Time=%0t | num=%b (%0d) | n=%0d | shifted=%b (%0d)", $time, num, num, n, shifted, shifted);

		num = 8'b11110000; n = 0; shifted = shift_right_n(num, n); #10;
      		num = 8'b11110000; n = 1; shifted = shift_right_n(num, n); #10;
      		num = 8'b11110000; n = 2; shifted = shift_right_n(num, n); #10;
      		num = 8'b11110000; n = 4; shifted = shift_right_n(num, n); #10;
      		num = 8'b10101010; n = 3; shifted = shift_right_n(num, n); #10;

      		#20 $finish;
	end
endmodule

