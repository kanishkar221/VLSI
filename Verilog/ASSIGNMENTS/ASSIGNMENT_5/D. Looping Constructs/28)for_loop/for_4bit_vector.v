module for_4bit_vector;
	reg [3:0] data;    
	integer i;         
	integer ones;      

	initial begin
		data = 4'b1011;
		ones = 0;

		$display("Input data = %b", data);
		for (i = 0; i < 4; i = i + 1) begin
			if (data[i] == 1'b1)
				ones = ones + 1;
		end

		$display("Number of 1s = %0d", ones);
		#10 $finish;
	end
endmodule

