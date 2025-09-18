module square_num;
	reg [7:0] num;
	reg [15:0] sqr;

	function [15:0] square;
		input [7:0] x;
		begin
			square = x * x;
		end
 	endfunction

	initial begin
		$monitor("Time=%0t | num=%0d | square=%0d", $time, num, sqr);

		num = 5; sqr = square(num); #10;
		num = 10; sqr = square(num); #10;
		num = 15; sqr = square(num); #10;
		num = 20; sqr = square(num); #10;
		num = 25; sqr = square(num); #10;

		#50 $finish;
		end
endmodule

