module SRFF_async_tb;

	reg clk, rst_async, set_async, s, r;
	wire q;

	SRFF_async uut(.clk(clk), .rst_async(rst_async), .set_async(set_async), .s(s), .r(r), .q(q));
	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		rst_async = 0; set_async = 0; s = 0; r = 0;

		#2  rst_async = 1; 
		#10 rst_async = 0;  

		#2  set_async = 1; 
		#10 set_async = 0;
		#5  s = 1; r = 0;   // set at clk edge
		#10 s = 0; r = 1;   // reset at clk edge
		#10 s = 1; r = 1;   // invalid -> q=0
		#20 $finish;
	end

	initial begin
		$monitor("Time=%0t | clk=%b | rst_async=%b | set_async=%b | s=%b | r=%b | q=%b", $time, clk, rst_async, set_async, s, r, q);
	end

endmodule

