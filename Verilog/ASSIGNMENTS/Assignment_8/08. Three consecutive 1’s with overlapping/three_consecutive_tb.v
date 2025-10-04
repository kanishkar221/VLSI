module three_consecutive_tb;
	reg clk, reset;
	reg x;
	wire y;

	three_consecutive dut ( .clk(clk), .reset(reset), .x(x), .y(y) );

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		$dumpfile("three_consecutive.vcd");
		$dumpvars(0, three_consecutive_tb);
		$monitor("time = %0t | clk  = %b | reset = %b | state = %b | next_state = %b | x = %b | y = %b", $time, clk, reset, dut.state, dut.next_state, x, y);
		reset = 1; x = 0;
		#20 reset = 0;
		x = 0; 
		#20

		#10 x = 1;   
		#10 x = 0;   
		#10 x = 1;   
		#10 x = 1;   
		#10 x = 1;   
		#10 x = 1;   
		#10 x = 0;   
		#10 x = 0;   
		#10 x = 1;   
		#10 x = 1;   
		#10 x = 1;   
		#10 $finish;
	end
endmodule

