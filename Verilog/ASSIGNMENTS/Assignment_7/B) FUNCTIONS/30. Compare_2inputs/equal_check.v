module equal_check;

	reg [7:0] A, B;
	reg eq;

	function is_equal;
		input [7:0] x, y;
		begin
			if (x == y)
				is_equal = 1;
       			else
           			is_equal = 0;
    			end
	endfunction

	initial begin
		$monitor("Time=%0t | A=%0d | B=%0d | Equal=%0b", $time, A, B, eq);

		A = 8'd10; B = 8'd10; eq = is_equal(A, B); #10;
		A = 8'd15; B = 8'd20; eq = is_equal(A, B); #10;
		A = 8'd50; B = 8'd50; eq = is_equal(A, B); #10;
		A = 8'd100; B = 8'd99; eq = is_equal(A, B); #10;
		A = 8'd200; B = 8'd200; eq = is_equal(A, B); #10;

		#20 $finish;
	end
endmodule

