module count_ones;

	reg [7:0] data;
	reg [3:0] ones; 

	function [3:0] ones_count;
		input [7:0] x;
		integer i;
		reg [3:0] cnt;
		begin
			cnt = 0;
   			for (i = 0; i < 8; i = i + 1) begin
            			if (x[i] == 1'b1)
				cnt = cnt + 1;
			end
			ones_count = cnt;
		end
	endfunction

	initial begin
		$monitor("Time=%0t | data=%b | ones=%0d", $time, data, ones);

		data = 8'b00000000; ones = ones_count(data); #10;
      		data = 8'b00000001; ones = ones_count(data); #10;
   		data = 8'b10101010; ones = ones_count(data); #10;
     		data = 8'b11110000; ones = ones_count(data); #10;
     		data = 8'b11111111; ones = ones_count(data); #10;
     		data = 8'b11001101; ones = ones_count(data); #10;

		#20 $finish;
	end
endmodule

