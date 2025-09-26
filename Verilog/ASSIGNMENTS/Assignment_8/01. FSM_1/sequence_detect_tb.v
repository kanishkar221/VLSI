module sequence_detect_tb;
	reg clk, reset, x;
	wire y;

	sequence_detect uut(
		.clk(clk),
		.reset(reset),
		.x(x),
		.y(y)
	);

	initial clk = 0;
	always #5 clk = ~clk;
		
	initial begin
		$dumpfile ("sequence_detect.vcd");
		$dumpvars(0, sequence_detect_tb);

		$monitor("Time = %0t | reset=%b | x=%b | state=%b | next_state=%b | y=%b", $time, reset, x, uut.state, uut.next_state, y);
		
		reset = 0;
	       	x = 0;
		#10 reset = 1;
		
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		$finish;
	end
endmodule

		
