module array_avg;
	integer arr[0:4];     
        integer avg;          
	integer i;
	
	task calc_average;
		output integer result;    
		integer j, sum;
		begin
			sum = 0;
			for (j = 0; j < 5; j = j + 1) begin
				sum = sum + arr[j];   
			end
			result = sum / 5;   
		end
	endtask

	initial begin
		arr[0] = 10;
		arr[1] = 20;
		arr[2] = 30;
		arr[3] = 40;
		arr[4] = 50;

		calc_average(avg);

		$display("Array Elements = %0d %0d %0d %0d %0d", arr[0], arr[1], arr[2], arr[3], arr[4]);
		$display("Average = %0d", avg);
		#10 $finish;
	end
endmodule


