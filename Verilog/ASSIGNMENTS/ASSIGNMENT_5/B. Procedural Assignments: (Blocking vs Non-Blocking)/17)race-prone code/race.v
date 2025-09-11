module race;
	reg a, b, x, y, clk;

	// Blocking assignments
	always @(posedge clk) a = b;
	always @(posedge clk) b = a;
	
	// Non-blocking assignments
	always @(posedge clk) x <= y;
	always @(posedge clk) y <= x;
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		$monitor("Time=%0t | clk=%b | a=%b | b=%b | x=%b | y=%b",$time, clk, a, b, x, y);

		a = 1; b = 0; 
		x = 0; y = 1;

		#100 $finish;
	end
endmodule

