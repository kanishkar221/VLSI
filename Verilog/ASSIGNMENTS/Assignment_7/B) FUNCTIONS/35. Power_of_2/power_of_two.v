module power_of_two;

	reg [7:0] num;
	reg is_power2;

	function is_pow2;
		input [7:0] x;
  		begin
          		if (x > 0 && ((x & (x - 1)) == 0))
             			is_pow2 = 1'b1;
         		else
             			is_pow2 = 1'b0;
		end
	endfunction

	initial begin
		$monitor("Time=%0t | num=%0d | is_power2=%b", $time, num, is_power2);

		num = 0;   is_power2 = is_pow2(num); #10;  
      		num = 1;   is_power2 = is_pow2(num); #10;  
      		num = 2;   is_power2 = is_pow2(num); #10;  
      		num = 3;   is_power2 = is_pow2(num); #10;  
       		num = 4;   is_power2 = is_pow2(num); #10;  
       		num = 8;   is_power2 = is_pow2(num); #10;  
       		num = 12;  is_power2 = is_pow2(num); #10;  
        	num = 16;  is_power2 = is_pow2(num); #10;  
        	num = 31;  is_power2 = is_pow2(num); #10;  
        	num = 32;  is_power2 = is_pow2(num); #10;  

      		#20 $finish;
    	end
endmodule

