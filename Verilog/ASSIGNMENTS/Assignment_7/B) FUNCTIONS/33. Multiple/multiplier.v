module multiplier;
	reg [7:0] a, b;
	reg [15:0] product;

	function [15:0] mul_func;
		input [7:0] x, y;
      		integer i;
      		begin
         		mul_func = 0;
          		for (i = 0; i < 8; i = i + 1) begin
         			if (y[i])               
                			mul_func = mul_func + (x << i);  
         			end
     		end
	endfunction

	initial begin
		$monitor("Time=%0t | a=%0d | b=%0d | product=%0d", $time, a, b, product);

     		a = 5;  b = 3;   product = mul_func(a, b); #10;  
      		a = 7;  b = 6;   product = mul_func(a, b); #10;  
      		a = 12; b = 4;   product = mul_func(a, b); #10;  
      		a = 15; b = 15;  product = mul_func(a, b); #10;  
      		a = 9;  b = 0;   product = mul_func(a, b); #10;  

     		#20 $finish;
	end
endmodule

