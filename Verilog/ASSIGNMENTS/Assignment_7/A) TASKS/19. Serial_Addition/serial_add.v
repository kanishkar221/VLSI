module serial_add;
	reg  [3:0] a, b;        
	reg  [4:0] sum;         
	integer i;
	
	task serial_add_task;
		input  [3:0] x, y;      
		output [4:0] result;    
		integer j;
      		reg carry;
      		reg [4:0] temp;
      		begin
        		carry = 0;
         		temp  = 0;
           		for (j = 0; j < 4; j = j + 1) begin
				temp[j] = x[j] ^ y[j] ^ carry;    
				carry   = (x[j] & y[j]) | (x[j] & carry) | (y[j] & carry); 
				#5;  
			end
		        temp[4] = carry;   
		        result = temp;
		end
	endtask
	
	initial begin
		$monitor("Time=%0t | a=%b | b=%b | sum=%b (decimal=%0d)", $time, a, b, sum, sum);

		a = 4'b1011; b = 4'b0110; serial_add_task(a, b, sum); #30;
      		a = 4'b1111; b = 4'b1111; serial_add_task(a, b, sum); #30;
      		a = 4'b1001; b = 4'b0011; serial_add_task(a, b, sum); #30;

  		#20 $finish;
	end
endmodule

