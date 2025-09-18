module mult_display;
	reg [7:0] a, b;

	task multiply_task;
		input  [7:0] x, y;
		reg   [15:0] product;   
		begin
			product = x * y;
			$display("Time=%0t | a=%0d | b=%0d | product=%0d", $time, x, y, product);
		end
	endtask

	initial begin
		a = 8'd10; b = 8'd5;   multiply_task(a, b); #5;
		a = 8'd12; b = 8'd12;  multiply_task(a, b); #5;
		a = 8'd25; b = 8'd4;   multiply_task(a, b); #5;
		a = 8'd100; b = 8'd3;  multiply_task(a, b); #5;
		a = 8'd255; b = 8'd2;  multiply_task(a, b); #5;

		#20 $finish;
	end
endmodule

