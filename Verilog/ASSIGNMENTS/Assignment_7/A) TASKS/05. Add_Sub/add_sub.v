module add_sub_task;
	reg  [7:0] a, b;          
	reg  [8:0] sum;           
	reg  [8:0] diff; 

	task add_sub_task;
		input  [7:0] x, y;
		output [8:0] add_result;
		output [8:0] sub_result;
		begin
			add_result = x + y;
			sub_result = {1'b0, x} - {1'b0, y};
		end
	endtask

	initial begin
		$monitor("Time=%0t | a=%d | b=%d | sum=%d | diff=%d", $time, a, b, sum, diff);

		a = 8'd15; b = 8'd10; add_sub_task(a, b, sum, diff); #10;
    		a = 8'd50; b = 8'd20; add_sub_task(a, b, sum, diff); #10;
      		a = 8'd100; b = 8'd150; add_sub_task(a, b, sum, diff); #10;
      		a = 8'd200; b = 8'd100; add_sub_task(a, b, sum, diff); #10;
      		a = 8'd25; b = 8'd25; add_sub_task(a, b, sum, diff); #10;

		#50 $finish;
	end
endmodule

