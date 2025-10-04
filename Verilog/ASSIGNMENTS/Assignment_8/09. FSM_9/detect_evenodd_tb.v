module detect_evenodd_tb;
	reg clk;
	reg reset;
	reg in;
	wire even_zero;
	wire even_one;

	detect_evenodd dut (
		.clk(clk),
		.reset(reset),
		.in(in),
		.even_zero(even_zero),
		.even_one(even_one)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		$dumpfile("detect_evenodd.vcd");
		$dumpvars(0, detect_evenodd_tb);
		$monitor("time=%0t | in=%b | even_zero=%b | even_one=%b", $time, in, even_zero, even_one);
			
		reset = 1;
		in = 0;
		#10;
		reset = 0;
		#10 in = 1;
		#10 in = 0;
		#10 in = 1;
		#10 in = 1;
		#10 in = 0;
		#10 in = 0;
		#10 in = 1;

		#20 $finish;
		
	end
endmodule
	  
