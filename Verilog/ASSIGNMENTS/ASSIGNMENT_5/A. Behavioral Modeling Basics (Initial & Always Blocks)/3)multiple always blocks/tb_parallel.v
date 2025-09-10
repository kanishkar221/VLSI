module tb_parallel;
	reg clk;
	reg rst_n;
	wire [3:0] a;
	wire [3:0] b;
	wire [4:0] sum;

	parallel dut (.clk(clk), .rst_n(rst_n), .a(a), .b(b), .sum(sum));
	
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end
	initial begin
		$dumpfile("parallel.vcd");
		$dumpvars(0, tb_parallel);

		$monitor("%0t ns : rst_n=%b clk=%b a=%0d b=%0d sum=%0d", $time, rst_n, clk, a, b, sum);
		rst_n = 1'b0;
		#12 rst_n = 1'b1;
		#100 $finish;
		end
endmodule

		
