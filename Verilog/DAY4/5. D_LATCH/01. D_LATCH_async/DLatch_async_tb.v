module DLatch_async_tb;
	reg d, en, reset;
	wire q;

	DLatch_async uut(.d(d), .en(en), .reset(reset), .q(q));
	
	initial begin
		d = 0; en = 0; reset = 0;
		#5 reset = 1;
		#5 reset = 0;
		#5 en = 1; d = 1;
		#5 d = 0;
		#5 en = 0; d = 1;
		#5 reset = 1;
		#5 reset = 0;
		#10 $finish;
	end
	initial begin
		$monitor ("Time=%0t | d=%b | en=%b | reset=%b | q=%b", $time, d, en, reset, q);
	end
endmodule

