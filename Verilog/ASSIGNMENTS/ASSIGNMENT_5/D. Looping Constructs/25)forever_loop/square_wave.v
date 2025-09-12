module square_wave;
	reg clk;

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		$monitor("Time=%t | clk=%b", $time, clk);
		#100 $finish;
	end
endmodule


