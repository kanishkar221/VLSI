module drive_global;
	reg [7:0] a, b;        
	reg [8:0] global_sum;

	task drive_sum_task;
		input [7:0] x, y;
		begin
			global_sum = x + y;   
		end
	endtask

	initial begin
		$monitor("Time=%0t | a=%d b=%d | global_sum=%d", $time, a, b, global_sum);

		a = 8'd10; b = 8'd20; drive_sum_task(a, b); #10;
      		a = 8'd50; b = 8'd25; drive_sum_task(a, b); #10;
     		a = 8'd100; b = 8'd50; drive_sum_task(a, b); #10;

  		#20 $finish;
   	end
endmodule

