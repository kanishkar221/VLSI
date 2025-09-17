module task_call_task;
	reg [7:0] a, b, c, d;
	reg [8:0] sum1, sum2;
	reg [9:0] total_sum;

	task add_task;
		input [7:0] x, y;
		output [8:0] s;
		begin
			s = x + y;
		end
	endtask

	task double_add_task;
		input [7:0] p, q, r, s;
		output [9:0] total;  
      		reg [8:0] temp1, temp2;
     		 begin
          		add_task(p, q, temp1);
          	        add_task(r, s, temp2);
            		total = temp1 + temp2;
		end
	endtask

	initial begin
		$monitor("Time=%0t | a=%d b=%d c=%d d=%d | sum1+sum2=%d", $time, a, b, c, d, total_sum);

		a = 8'd10; b = 8'd20; c = 8'd5; d = 8'd15;
      		double_add_task(a, b, c, d, total_sum); #10;

      		a = 8'd50; b = 8'd25; c = 8'd30; d = 8'd20;
      		double_add_task(a, b, c, d, total_sum); #10;

     		a = 8'd100; b = 8'd50; c = 8'd25; d = 8'd25;
     		double_add_task(a, b, c, d, total_sum); #10;

      		#50 $finish;
	end
endmodule

