module wrong_race;
	reg clk, a, b;

	always @(posedge clk) a = b;
	always @(posedge clk) b = a;
	
	initial begin
		clk = 0;
	       	a = 0;
	       	b = 1; 
		forever #5 clk = ~clk;
	end

	initial begin
		$monitor("Time=%0t clk=%b a=%b b=%b", $time, clk, a, b);
	        #100 $finish;
	end
endmodule

