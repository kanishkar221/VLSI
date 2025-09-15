module TFF_async_tb;

	reg clk, rst_async, t;
	wire q;

	TFF_async uut(.clk(clk), .rst_async(rst_async), .t(t), .q(q));

	initial clk = 0;
		always #5 clk = ~clk;

		initial begin
		rst_async = 0; t = 0;

		#2  rst_async = 1;  
		#10 rst_async = 0;  

		#5  t = 1;  
		#10 t = 0;  
		#10 t = 1;  
		#20 $finish;
	end

	initial begin
		$monitor("Time=%0t | clk=%b | rst_async=%b | t=%b | q=%b",
                  $time, clk, rst_async, t, q);
	end

endmodule

