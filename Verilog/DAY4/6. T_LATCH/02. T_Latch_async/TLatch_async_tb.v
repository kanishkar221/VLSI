module TLatch_async_tb;
	reg t, en, reset;
	wire q;

	TLatch_async uut(.t(t), .en(en), .reset(reset), .q(q));
	
	initial begin
        
        t = 0; en = 0; reset = 0;

		#5  reset = 1;         
		#5  reset = 0;
      		#5  en = 1; t = 1;     
      		#5  t = 1;             
      		#5  t = 0;             
      		#5  en = 0; t = 1;     
      		#5  reset = 1;         
      		#5  reset = 0;
     		#10 $finish;
  	end

	initial begin
		$monitor("Time=%0t | t=%b | en=%b | reset=%b | q=%b", $time, t, en, reset, q);
	end

endmodule

