module reverse;
	reg  [7:0] num;       
	reg  [7:0] rev_num;   
	integer i;

	task reverse_bits;
		input  [7:0] x;
		output [7:0] y;
		integer j;
		begin
			y = 0;
				for (j = 0; j < 8; j = j + 1) begin
					y[j] = x[7-j]; 
 				end
		end
	endtask

	initial begin
		$monitor("Time=%0t | num=%b | reversed=%b", $time, num, rev_num);


		num = 8'b11010010; reverse_bits(num, rev_num); #10;
     		num = 8'b10101010; reverse_bits(num, rev_num); #10;
      		num = 8'b00001111; reverse_bits(num, rev_num); #10;
      		num = 8'b11110000; reverse_bits(num, rev_num); #10;
      		num = 8'b00110101; reverse_bits(num, rev_num); #10;

		#50 $finish;
	end
endmodule

