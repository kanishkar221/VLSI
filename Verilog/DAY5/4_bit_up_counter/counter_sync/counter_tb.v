`timescale 1ns/1ps
module counter_tb;
	reg clk, reset;
	wire [3:0] count;
	counter uut (
		.clk(clk),
		.reset(reset),
		.count(count)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$dumpfile("counter.vcd");   
		$dumpvars(0, counter_tb);

		reset = 1;
		#10;
		reset = 0;   
		#100;
		$finish;
	end
	initial begin
		$monitor("Time=%0t | reset=%b | count=%b", $time, reset, count);
	end
endmodule


