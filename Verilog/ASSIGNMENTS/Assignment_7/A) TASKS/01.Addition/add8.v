module add8;
	reg  [7:0] a, b;
	reg  [8:0] sum_task;
	integer i;

	task add8_task;
		input  [7:0] x;
		input  [7:0] y;
		output [8:0] s;
		begin
			s = x + y;
		end
	endtask

	initial begin
		$dumpfile("add8.vcd");
		$dumpvars(0, add8);

		$monitor("Time=%0t : a=%d b=%d sum=%d carry=%b", $time, a, b, sum_task[7:0], sum_task[8]);
		a = 8'd10; b = 8'd20; #1;
		add8_task(a, b, sum_task);

		a = 8'hFF; b = 8'h01; #1;
		add8_task(a, b, sum_task);

		for (i = 0; i < 4; i = i + 1) begin
			a = $random;
			b = $random;
			#1 add8_task(a, b, sum_task);
		end

		#1 $finish;
	end
endmodule

