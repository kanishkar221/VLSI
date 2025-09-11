module mix;
	reg a, b, clk;
	always @(posedge clk) begin
		a <= b;   // non-blocking assignment 
		b = a;    // blocking assignment 
	end
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	initial begin
		$monitor("Time=%0t | clk=%b | a=%b | b=%b", $time, clk, a, b);
		a = 0; b = 1;
		#50 $finish;
	end
endmodule

