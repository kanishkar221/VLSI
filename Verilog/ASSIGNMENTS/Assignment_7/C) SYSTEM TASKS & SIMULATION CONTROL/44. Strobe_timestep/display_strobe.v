module display_strobe;
	reg  [3:0] a, b;    
	wire [4:0] sum;

	assign sum = a + b;
	integer i;
	
	initial begin
		$display("Time | A | B | SUM");
		$strobe("%4t | %4d | %4d | %4d", $time, a, b, sum);
	
		for (i = 0; i < 5; i = i + 1) begin
		a = $random % 16;  
		b = $random % 16;  
		#4;

	end
	#4; $finish;
	end
endmodule

