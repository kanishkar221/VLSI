module maximum;
	reg [7:0] a, b, c, d;      
	reg [7:0] max_val;

	task find_max;
		input [7:0] x1, x2, x3, x4;
		output [7:0] max_out;
		begin
			max_out = x1;
			if (x2 > max_out) max_out = x2;
			if (x3 > max_out) max_out = x3;
			if (x4 > max_out) max_out = x4;
		end
	endtask

	initial begin
		$monitor("Time=%0t | a=%d b=%d c=%d d=%d | max=%d", $time, a, b, c, d, max_val);

		a = 8'd10; b = 8'd25; c = 8'd5;  d = 8'd20; find_max(a, b, c, d, max_val); #10;
		a = 8'd50; b = 8'd35; c = 8'd75; d = 8'd60; find_max(a, b, c, d, max_val); #10;
		a = 8'd100; b = 8'd90; c = 8'd80; d = 8'd120; find_max(a, b, c, d, max_val); #10;
	 	a = 8'd5; b = 8'd5; c = 8'd5; d = 8'd5; find_max(a, b, c, d, max_val); #10;

		#50 $finish;
	end
endmodule

