module tb_TLatch;
	reg t, en;
	wire q;

	TLatch uut (
		.t(t),
		.en(en),
		.q(q)
	);

	initial begin
		$dumpfile("TLatch.vcd");
		$dumpvars(0, tb_TLatch);

		$monitor("Time=%0t | t=%b en=%b q=%b", $time, t, en, q);

		t = 0; en = 0;
		#10 t = 1; en = 0;
		#10 en = 1; t = 1;  
		#10 t = 1;          
		#10 t = 0;
		#10 en = 0; t = 1;
		#10 en = 1; t = 1;    
		#10 t = 0;
		#10 t = 1;
		#20 $finish;
	end
endmodule

