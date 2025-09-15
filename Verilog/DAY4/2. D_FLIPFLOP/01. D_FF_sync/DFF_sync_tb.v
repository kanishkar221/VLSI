module DFF_sync_tb;
	reg clk, rst_sync, d;
	wire q;

	DFF_sync uut(.clk(clk), .rst_sync(rst_sync), .d(d), .q(q));
	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		rst_sync = 0; d = 0;
     		#5 d = 1;
      		#10 rst_sync = 1; 
      		#10 rst_sync = 0; 
     		#5 d = 0;
      		#10 d = 1;
      		#20 $finish;
 	end

	initial begin
		$monitor("Time=%0t | clk=%b | rst_sync=%b | d=%b | q=%b",$time, clk, rst_sync, d, q);
	end
endmodule

