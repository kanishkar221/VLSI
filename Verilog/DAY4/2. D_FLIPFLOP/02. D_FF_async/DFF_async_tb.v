module DFF_async_tb;
	reg clk, rst_async, d;
   	wire q;

	DFF_async uut(.clk(clk), .rst_async(rst_async), .d(d), .q(q));

    	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		rst_async = 0; d = 0;
		#2 rst_async = 1;       
     	 	#10 rst_async = 0;      
     		#5 d = 1;
    		#10 d = 0;
     		#10 d = 1;
     		#20 $finish;
	end

	initial begin
		$monitor("Time=%0t | clk=%b | rst_async=%b | d=%b | q=%b", $time, clk, rst_async, d, q);
	end
endmodule

