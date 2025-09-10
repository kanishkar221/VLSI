module tb_adder_blocking;
	reg [1:0] a, b;
	wire [2:0] sum;

	adder_blocking dut (.a(a), .b(b), .sum(sum));

	initial begin
		$dumpfile("adder_blocking.vcd");   
		$dumpvars(0, tb_adder_blocking);
	end
	
	initial begin
		$display("time\ta\tb\tsum");
		$monitor("%0t\t%b\t%b\t%b", $time, a, b, sum);

		a = 2'b00; b = 2'b00; #5;
		a = 2'b01; b = 2'b10; #5;
		a = 2'b11; b = 2'b01; #5;
		a = 2'b10; b = 2'b11; #5;
		#5 $finish;
		end
endmodule


