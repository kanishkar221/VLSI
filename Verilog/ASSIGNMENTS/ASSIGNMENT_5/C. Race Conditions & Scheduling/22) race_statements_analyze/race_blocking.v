module race_blocking;
	reg a, b, clk;
	always @(posedge clk) begin
		a = b;   
	end
	always @(posedge clk) begin
		b = a; 
	end
	initial begin
		clk = 0;
		forever #5 clk = ~clk;   
	end
	initial begin
		a = 0; b = 1;
		$monitor("Time=%0t | clk=%b | a=%b | b=%b", $time, clk, a, b);
		#50 $finish;
	end
endmodule

