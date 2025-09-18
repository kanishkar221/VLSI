module equal_check;
	reg  [7:0] a, b;
	reg        flag;

    	task check_equal;
		input  [7:0] x, y;
		output reg flag_out;
		begin
		if (x == y)
			flag_out = 1'b1;
		else
			flag_out = 1'b0;
		end
	endtask

	initial begin
		$monitor("Time=%0t | a=%0d | b=%0d | flag(equal)=%b", $time, a, b, flag);

		a = 8'd25; b = 8'd25; check_equal(a, b, flag); #5;   
		a = 8'd50; b = 8'd20; check_equal(a, b, flag); #5;  
		a = 8'd100; b = 8'd100; check_equal(a, b, flag); #5;
		a = 8'd75; b = 8'd80; check_equal(a, b, flag); #5;   
		a = 8'd0; b = 8'd0; check_equal(a, b, flag); #5;     

		#20 $finish;
	end
endmodule


