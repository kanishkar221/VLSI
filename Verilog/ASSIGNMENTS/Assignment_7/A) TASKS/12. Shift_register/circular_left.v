module circular_left;
	reg [7:0] data_in;
	reg [7:0] data_out;

    
	task left_circular_shift;
		input  [7:0] in_val;
		output [7:0] out_val;
		begin
			out_val = {in_val[6:0], in_val[7]};  

		end
	endtask
	initial begin
		$monitor("Time=%0t | Input=%b | Left Circular Shift=%b", $time, data_in, data_out);

		data_in = 8'b10110011; #5;
		left_circular_shift(data_in, data_out);

		#10 data_in = 8'b11110000;
		left_circular_shift(data_in, data_out);

		#10 data_in = 8'b00000001;
		left_circular_shift(data_in, data_out);

		#10 data_in = 8'b10000000;
		left_circular_shift(data_in, data_out);

		#20 $finish;
	end
endmodule

