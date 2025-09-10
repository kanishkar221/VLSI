module clock_generator;;
	reg clk;
	initial begin
		clk = 0; 
		forever #5 clk = ~clk; 
	end
	initial begin
		$dumpfile("clock_generator.vcd");
		$dumpvars(0, clock_generator);
		$monitor("time=%t, clk=%b", $time, clk); #50 $finish; 
	end
endmodule

