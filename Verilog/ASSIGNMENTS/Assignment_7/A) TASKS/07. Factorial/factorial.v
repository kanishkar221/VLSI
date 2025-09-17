module factorial;
	reg [7:0] num;          
	reg [31:0] fact;        
	integer i;

	task calc_factorial;
		input  [7:0] n;
      		output [31:0] f;
      		integer j;
      		begin
         		f = 1;
          		for (j = 1; j <= n; j = j + 1) begin
             			f = f * j;
          		end
      		end
	endtask
	
	initial begin
		$monitor("Time=%0t | num=%0d | factorial=%0d", $time, num, fact);

		num = 5; calc_factorial(num, fact); #10;
		num = 6; calc_factorial(num, fact); #10;
     		num = 7; calc_factorial(num, fact); #10;
     		num = 8; calc_factorial(num, fact); #10;
      		num = 10; calc_factorial(num, fact); #10;

      		#50 $finish;
   	end
endmodule

