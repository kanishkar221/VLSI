module write_display;
	reg [3:0] a, b;
	wire [4:0] sum;

	assign sum = a + b;

	initial begin 
		a = 4'd5;
		b = 4'd7;

		$display("Using $display :");
		$display("a=%0d, b=%0d, sum=%0d", a, b, sum);

		$display("-------------------");

		$display("Using $write:");
		$write("a=%0d,", a);
		$write("b=%0d,", b);
		$write("sum =%0d",sum);
		$display(" <-- End of the line ");// Because of Display
		
		$finish;
	end
endmodule

