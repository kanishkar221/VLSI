module square;
	reg  [7:0] num;        
	reg  [15:0] square;

	task calc_square;
		input  [7:0] x;
		output [15:0] sq;
		begin
			sq = x * x;
		end
	endtask
	
	initial begin
		$monitor("Time=%0t | num=%d | square=%d", $time, num, square);

		num = 8'd5;   calc_square(num, square);
		#10 num = 8'd10;  calc_square(num, square);
		#10 num = 8'd15;  calc_square(num, square);
		#10 num = 8'd20;  calc_square(num, square);
		#10 num = 8'd25;  calc_square(num, square);

 		#50 $finish;
	end
endmodule

