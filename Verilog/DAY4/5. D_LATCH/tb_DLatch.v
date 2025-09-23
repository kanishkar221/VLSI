module tb_DLatch;
	reg d, en;
	wire q;

	DLatch uut (
 		.d(d),
		.en(en),
		.q(q)
	);
	
	initial begin
		$dumpfile("DLatch.vcd");
		$dumpvars(0,tb_DLatch);

		$monitor("Time=%0t | d=%b en=%b q=%b", $time, d, en, q);

		d = 0; en = 0;
		#10 en = 0; d = 1;   
		#10 d = 0;           
		#10 en = 1; d = 1;   
		#10 d = 0;           
		#10 en = 0; d = 1;   
		#10 en = 1; d = 0;   
		#10 d = 1;           

		#20 $finish;
	end
endmodule


	
