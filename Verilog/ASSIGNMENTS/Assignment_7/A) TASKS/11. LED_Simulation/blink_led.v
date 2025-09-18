module blink_led;
	reg led;

	task blink_task;
		input integer times;    
		input integer delay;    
		integer i;
		begin
			for (i = 0; i < times; i = i + 1) begin
				led = 1;  
				#delay;
				led = 0;   
			        #delay;
			end
		end
	endtask
	
	initial begin
		$dumpfile("blink_led.vcd");   
		$dumpvars(0, blink_led);

		$monitor("Time=%0t | LED=%b", $time, led);

		led = 0;  
		#5 blink_task(5, 10);  

		#100 $finish;
	end
endmodule

