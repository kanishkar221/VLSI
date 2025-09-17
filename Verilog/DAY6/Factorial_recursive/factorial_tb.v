module factorial_tb;
	reg  [7:0] num;
	wire [15:0] res;

	factorial uut (
		.n(num),
		.result(res)
	);

	initial begin
		$monitor("Time=%0t | num=%0d | factorial=%0d", $time, num, res);
		num = 0; #10;
		num = 1; #10;
 		num = 2; #10;
		num = 3; #10;
		num = 4; #10;
		num = 5; #10;

		$finish;
	end
endmodule

