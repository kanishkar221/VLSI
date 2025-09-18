module toggle_clock;
	reg clk;
	
	task toggle_clk_task;
		input integer times;   
		input integer delay;   
		integer i;
		begin
			for (i = 0; i < times; i = i + 1) begin
				#delay clk = ~clk;  
			end
		end
	endtask
	
	initial begin
		$dumpfile("toggle_clock.vcd");
		$dumpvars(0, toggle_clock);
		$monitor("Time=%0t | clk=%b", $time, clk);

		clk = 0;   

   		toggle_clk_task(10, 5);

		#20 $finish;
	end
endmodule

