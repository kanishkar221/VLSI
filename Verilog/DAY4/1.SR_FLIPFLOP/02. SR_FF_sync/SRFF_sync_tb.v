module SRFF_sync_tb;

	reg clk, rst_sync, set_sync, s, r;
	wire q;

	SRFF_sync uut(.clk(clk), .rst_sync(rst_sync), .set_sync(set_sync), .s(s), .r(r), .q(q));

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		rst_sync = 0; set_sync = 0; s = 0; r = 0;

		#5  s = 1; r = 0;     
		#10 rst_sync = 1;       
		#10 rst_sync = 0;
		#10 set_sync = 1;      
		#10 set_sync = 0;
		#10 s = 0; r = 1;      
		#10 s = 1; r = 1;      
		#20 $finish;
	end
	initial begin
		$monitor("Time=%0t | clk=%b | rst_sync=%b | set_sync=%b | s=%b | r=%b | q=%b", $time, clk, rst_sync, set_sync, s, r, q);
	end

endmodule

