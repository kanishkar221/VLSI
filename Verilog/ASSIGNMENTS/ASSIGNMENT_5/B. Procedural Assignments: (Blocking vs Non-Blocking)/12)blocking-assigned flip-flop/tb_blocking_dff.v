module tb_blocking_dff;

	reg clk, rst_n, d;
	wire q;
	blocking_dff uut (.clk(clk), .rst_n(rst_n), .d(d), .q(q));
	initial clk = 0;
	always #5 clk = ~clk;
	initial begin
        $monitor("time=%0t clk=%b rst_n=%b d=%b q=%b", $time, clk, rst_n, d, q);
	rst_n = 0; d = 0;
        #12 rst_n = 1;
	d = 1; #10;
        d = 0; #10;
        d = 1; #10;
	#20 $finish;
	end
endmodule

