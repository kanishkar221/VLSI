module bin_bcd_tb;
	reg clk;
	reg rst;
	reg start;
	reg [7:0] bin_in;
	wire [11:0] bcd_out;
	wire Done;

	bin_bcd uut (
		.clk(clk),
		.rst(rst),
		.start(start),
		.bin_in(bin_in),
		.bcd_out(bcd_out),
		.Done(Done)
	);

	always #5 clk = ~clk;

	initial begin

		$dumpfile("bin_bcd.vcd");
		$dumpvars(0, bin_bcd_tb);
		clk = 0;
		rst = 1;
		start = 0;
		bin_in = 0;
		$monitor("Time=%0t | Bin_in=%0d | BCD_out=%0d%0d%0d | Done=%b", $time, bin_in, bcd_out[11:8], bcd_out[7:4], bcd_out[3:0], Done);
		#12;
		rst = 0;
		bin_in = 8'd45;   
		start = 1; #10; start = 0;
		wait(Done);
		#10;
		$finish;
	end
endmodule

