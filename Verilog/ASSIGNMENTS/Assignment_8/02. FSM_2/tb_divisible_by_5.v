module tb_divisible_by_5;
	reg clk, reset, serial_in;
	wire out;

	divisible_by_5 uut (
		.clk(clk),
		.reset(reset),
		.serial_in(serial_in),
		.out(out)
	);
		
	always #5 clk = ~clk;
		
	initial begin
		$dumpfile ("divisible_by_5.vcd");
		$dumpvars(0, tb_divisible_by_5);

		$monitor("Time=%0t | Serial_in=%b | State Output=%b", $time, serial_in, out);
		
		clk = 0;
		reset = 1;
		serial_in = 0;
		#10 reset = 0;
		serial_in = 1;
		#10 serial_in = 0;
		#10 serial_in = 1;
		#10 serial_in = 0;
		#10 serial_in = 1;
	        #10 reset = 1;
		#10 reset = 0;
		reset = 1;
		#10 reset = 0;
		#10 serial_in = 1;
		#10 serial_in = 0;
		#10 serial_in = 1;
		#10 serial_in = 1;
		$finish;
	end
endmodule

