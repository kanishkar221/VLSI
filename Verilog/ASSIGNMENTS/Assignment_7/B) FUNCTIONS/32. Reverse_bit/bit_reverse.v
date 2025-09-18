module bit_reverse;

	reg [7:0] num;
	reg [7:0] rev_num;

	function [7:0] reverse_bits;
		input [7:0] x;
     		integer i;
    		begin
        		for (i = 0; i < 8; i = i + 1) begin
             			reverse_bits[i] = x[7 - i]; 
         		end
     		end
	endfunction

	initial begin
		$monitor("Time=%0t | num=%b | reversed=%b", $time, num, rev_num);

   		num = 8'b00000001; rev_num = reverse_bits(num); #10;
     		num = 8'b10110000; rev_num = reverse_bits(num); #10;
      		num = 8'b11110000; rev_num = reverse_bits(num); #10;
      		num = 8'b11010010; rev_num = reverse_bits(num); #10;
      		num = 8'b10000000; rev_num = reverse_bits(num); #10;

      		#20 $finish;
	end
endmodule

