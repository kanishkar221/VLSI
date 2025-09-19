module print_sum;
	reg  [3:0] a, b;      
	wire [4:0] sum;

	assign sum = a + b;

	initial begin
		a = 4'd8;
		b = 4'd2;
		$display("A = %d, B = %d, SUM = %d", a, b, sum);
		$finish;
	end
endmodule

