module JKFF_async_tb;

	reg clk, rst_async, set_async, j, k;
	wire q;

	JKFF_async uut(.clk(clk), .rst_async(rst_async), .set_async(set_async), .j(j), .k(k), .q(q));


	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		rst_async = 0; set_async = 0; j = 0; k = 0;
		#2  rst_async = 1;     
		#10 rst_async = 0;

		#2  set_async = 1;     
		#10 set_async = 0;
		
		#5  j = 1; k = 0;      
		#10 j = 0; k = 1;      
		#10 j = 1; k = 1;      
		#20 $finish;
	end

	initial begin
		$monitor("Time=%0t | clk=%b | rst_async=%b | set_async=%b | j=%b | k=%b | q=%b", $time, clk, rst_async, set_async, j, k, q);
	end
endmodule

