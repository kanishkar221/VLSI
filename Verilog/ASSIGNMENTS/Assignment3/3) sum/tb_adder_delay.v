module tb_adder_delay;
	reg  [3:0] a, b;
	wire [4:0] sum;

	adder_delay dut (.a(a), .b(b),.sum(sum));

	initial begin
	$dumpfile("adder_delay.vcd");
	$dumpvars(0, tb_adder_delay);
	$display("time)\t a b | sum");
	$monitor("%0t\t %b %b | %b", $time, a, b, sum);
	a = 0;  b = 0;   #10;   
	a = 0;  b = 1;   #10;   
	a = 1;  b = 0;   #10;   
	a = 1; b = 1;   #10;   
	a = 0;  b = 0;   #10;
	$finish;
end
endmodule



