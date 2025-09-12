module tb_counter_sync;
	reg clk;
	reg rst;
	wire [3:0] q;
	counter_sync uut (
		.clk(clk),
      		.rst(rst),
		.q(q)
	);
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	initial begin
		$display("\n--- 4-bit synchronous reset counter test ---\n");
		$monitor("%0t | clk=%b rst=%b -> q=%b (%0d)", $time, clk, rst, q, q);

		rst = 1;
		#12;
		rst = 0;
		#100;
		rst = 1;
		#10;
		rst = 0;
		#40;
		$display("\nTest finished\n");
		$finish;
	end
	initial begin
		$dumpfile("counter_sync.vcd");
		$dumpvars(0, tb_counter_sync);
	end

endmodule

