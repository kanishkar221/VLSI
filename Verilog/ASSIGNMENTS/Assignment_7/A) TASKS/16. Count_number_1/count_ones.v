module count_ones;
	reg  [7:0] data;
	integer ones_count;

	task count_ones_task;
		input  [7:0] in_val;
		output integer count;
		integer i;
		begin
			count = 0;
			for (i = 0; i < 8; i = i + 1) begin
				if (in_val[i] == 1'b1)
					count = count + 1;
			end
		end
	endtask

	initial begin
		$monitor("Time=%0t | data=%b | ones_count=%0d", $time, data, ones_count);

		data = 8'b10101010;  count_ones_task(data, ones_count); #5;
		data = 8'b11110000;  count_ones_task(data, ones_count); #5;
		data = 8'b00001111;  count_ones_task(data, ones_count); #5;
		data = 8'b11111111;  count_ones_task(data, ones_count); #5;
		data = 8'b00000000;  count_ones_task(data, ones_count); #5;

		#20 $finish;
	end
endmodule

