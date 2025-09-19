module monitor_signal;
	reg clk, data;
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		data = 0;
		#12 data = 1;
		#10 data = 0;
	  	#15 data = 1;
		#8  data = 0;
		#10 $finish;  
	end

	initial begin
		$monitor("Time=%0t clk=%b data=%b", $time, clk, data);
	end
endmodule

