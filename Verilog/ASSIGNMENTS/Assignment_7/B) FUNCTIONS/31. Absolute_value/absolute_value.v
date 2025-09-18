module absolute_value;

	reg signed [7:0] num;
	reg [7:0] abs_val;

	function [7:0] abs_func;
		input signed [7:0] x;
		begin
        		if (x < 0)
            			abs_func = -x;  
       			else
           			abs_func = x;   
		end
	endfunction
	
	initial begin
		$monitor("Time=%0t | num=%0d | abs_val=%0d", $time, num, abs_val);

		num = -50; abs_val = abs_func(num); #10;
      		num = -1;  abs_val = abs_func(num); #10;
      		num = 0;   abs_val = abs_func(num); #10;
   		num = 25;  abs_val = abs_func(num); #10;
    		num = 100; abs_val = abs_func(num); #10;

      		#20 $finish;
  	end
endmodule

