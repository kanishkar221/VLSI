module adder4(
	input [3:0] a,
	input [3:0] b,
	output [4:0] sum
);
	assign sum = a + b;
endmodule

module adder4_tb;
	reg [3:0] a, b;
        wire [4:0] sum;
	integer i, j;
	reg [4:0] expected;
	adder4 uut (.a(a), .b(b), .sum(sum));

	initial begin
	$dumpfile("adder4_tb.vcd"); 
	$dumpvars(0, adder4_tb);

	$display("Time | A B | Sum | Expected | Status");
	for (i = 0; i < 16; i = i + 1) begin
		for (j = 0; j < 16; j = j + 1) begin
			a = i;
			b = j;
			expected = i + j;
			#1;

			if (sum !== expected)
				$display("%0t | %b %b | %b | %b  <-- MISMATCH!", $time, a, b, sum, expected);
			else
				$display("%0t | %b %b | %b | %b  OK", $time, a, b, sum, expected);
		end
	end
	$finish;
end
endmodule

