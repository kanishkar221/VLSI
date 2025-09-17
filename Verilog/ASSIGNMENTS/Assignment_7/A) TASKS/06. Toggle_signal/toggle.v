module toggle;
	reg clk;  
	integer i;

	task toggle_signal;
		inout reg sig;   
		begin
			sig = ~sig;  
		        #10;         
		end
	endtask
	
	initial begin
		$dumpfile("toggle.vcd");
		$dumpvars(0, toggle);
		
		clk = 0;
		$monitor("Time=%0t | clk=%b", $time, clk);

        	for (i = 0; i < 10; i = i + 1) begin
			toggle_signal(clk);
		end

		#10 $finish;
	end
endmodule

