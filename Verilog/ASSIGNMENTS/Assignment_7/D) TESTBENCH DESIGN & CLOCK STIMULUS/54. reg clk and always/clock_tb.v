module clock_tb;
	reg clk;

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		$dumpfile("clock_tb.vcd");
      		$dumpvars(0, clock_tb);

		$monitor("Time=%0t | clk=%b", $time, clk);

		#50 $finish;
	end
endmodule

