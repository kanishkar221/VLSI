module TFF_sync_tb;

	reg clk, rst_sync, t;
	wire q;

	TFF_sync uut(.clk(clk), .rst_sync(rst_sync), .t(t), .q(q));

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		rst_sync = 0; t = 0;

		#5  t = 1;     
		#10 rst_sync = 1; 
     		#10 rst_sync = 0; 
      		#10 t = 0;     
      		#10 t = 1;     
   		#20 $finish;
 	end

	initial begin
    		$monitor("Time=%0t | clk=%b | rst_sync=%b | t=%b | q=%b", $time, clk, rst_sync, t, q);
 	end

endmodule

