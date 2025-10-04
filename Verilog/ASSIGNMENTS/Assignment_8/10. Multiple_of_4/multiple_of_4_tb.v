module multiple_of_4_tb;
	reg clk;
	reg reset;
	reg in;
	wire multiple_of_4;
	
	multiple_of_4 dut (
		.clk(clk),
		.reset(reset),
		.in(in),
		.multiple_of_4(multiple_of_4)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;  
	end

	initial begin
		$dumpfile("multiple_of_4.vcd");
		$dumpvars(0, multiple_of_4_tb);
		$monitor("time=%0t | in=%b | multiple_of_4=%b", $time, in, multiple_of_4);
		reset = 1;
		in = 0;
		#10;
		reset = 0;

		#10 in = 1;
		#10 in = 1;
     		#10 in = 0;
     		#10 in = 1;
		#10 in = 0;
     		#10 in = 1;
     		#10 in = 1;
     		#10 in = 1;
    		#10 in = 0;
    		#10 in = 1;
		#20 $finish;
	end
endmodule


