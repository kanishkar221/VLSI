module TLatch_sync_tb;

	reg clk, t, en, reset;
 	wire q;

  	TLatch_sync uut(.clk(clk), .t(t), .en(en), .reset(reset), .q(q));

  	initial clk = 0;
  	always #5 clk = ~clk;  

  	initial begin
        	t = 0; en = 0; reset = 0;

		#2 reset = 1;       
      		#10 reset = 0;      
		#10 en = 1; t = 1;  
      		#10 t = 0;          
      		#10 t = 1;          
      		#10 en = 0;         
     		#10 reset = 1;      
      		#10 reset = 0;
	   	#30 $finish;
	end

 	initial begin
		$monitor("Time=%0t | clk=%b | t=%b | en=%b | reset=%b | q=%b", $time, clk, t, en, reset, q);
	end

endmodule


