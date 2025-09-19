module power_func;

	reg [7:0] a, b;
	reg [31:0] result;

	function [31:0] power;
		input [7:0] base;
      		input [7:0] exp;
     		integer i;
      		begin
    			power = 1;   
     			for (i = 0; i < exp; i = i + 1) begin
          			power = power * base;
     			end
 		end
	endfunction

	initial begin
		$monitor("Time=%0t | a=%0d | b=%0d | a^b=%0d", $time, a, b, result);

      		a = 2; b = 3; result = power(a, b); #10;   // 2^3 = 8
     		a = 5; b = 2; result = power(a, b); #10;   // 5^2 = 25
      		a = 3; b = 4; result = power(a, b); #10;   // 3^4 = 81
     		a = 7; b = 0; result = power(a, b); #10;   // 7^0 = 1
    		a = 10; b = 5; result = power(a, b); #10;  // 10^5 = 100000

      		#20 $finish;
  	end
endmodule

