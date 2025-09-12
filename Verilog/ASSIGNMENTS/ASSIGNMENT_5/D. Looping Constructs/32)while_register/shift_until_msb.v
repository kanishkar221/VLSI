module shift_until_msb;
	reg [7:0] data;   
	integer count;
	initial begin
		data = 8'b0000_1010;   
		count = 0;

		$display("Initial data = %b", data);
		while (data[7] != 1'b1) begin
			data = data << 1;
			count = count + 1;
			$display("Shift %0d: data = %b", count, data);
		end

		$display("Final data with MSB=1: %b after %0d shifts", data, count);
		#10 $finish;
	end
endmodule

