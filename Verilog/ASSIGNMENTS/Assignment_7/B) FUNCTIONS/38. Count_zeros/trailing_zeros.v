module trailing_zeros;

	reg [7:0] num;
	integer count;

	function integer count_tz;
		input [7:0] x;
      		integer i;
      		begin
         		count_tz = 0;
      			if (x == 0) begin
         			count_tz = 8;   // all bits are zero
        		end else begin : loop_block
				for (i = 0; i < 8; i = i + 1) begin
					if (x[i] == 1'b0)
						count_tz = count_tz + 1;
					else
  						disable loop_block;  
				end
			end
		end
	endfunction

	initial begin
		$monitor("Time=%0t | num=%b (%0d) | trailing_zeros=%0d", $time, num, num, count);

   		num = 8'b00000000; count = count_tz(num); #10;
      		num = 8'b00000001; count = count_tz(num); #10;
      		num = 8'b00010100; count = count_tz(num); #10;
      		num = 8'b10000000; count = count_tz(num); #10;
     		num = 8'b11111110; count = count_tz(num); #10;

		#20 $finish;
	end
endmodule

