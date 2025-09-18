module factorial;
	integer n;
	integer fact;

	function automatic integer factorial (input integer num);
	begin
		if(num<=1)
			factorial = 1;
		else
			factorial = num * factorial(num-1);
		end
	endfunction
	
	initial begin
		$monitor("Time=%0t | n=%0d | factorial=%0d", $time, n, fact);

		n = 0; fact = factorial(n); #10;
    		n = 1; fact = factorial(n); #10;
      		n = 4; fact = factorial(n); #10;
      		n = 5; fact = factorial(n); #10;
     		n = 6; fact = factorial(n); #10;
     		n = 7; fact = factorial(n); #10;

      		#80;
      		$finish;
	end

endmodule
	
