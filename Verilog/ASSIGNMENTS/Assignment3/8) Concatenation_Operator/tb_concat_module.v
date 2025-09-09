`timescale 1ns/1ps

module tb_concat_module;

	reg a;
	reg [1:0] b;
	reg [1:0] c;
	wire [2:0] y;

	concat_module uut (
		 .a(a),
		 .b(b),
		 .c(c),
		 .y(y)
	);
	initial begin

	$dumpfile("concat_module.vcd");
        $dumpvars(0, tb_concat_module);
	$display("Time\ta\tb\tc\ty");
	$monitor("%0t\t%b\t%b\t%b\t%b", $time, a, b, c, y);

	a = 1'b0; b = 2'b01; c = 2'b10; #10;
        a = 1'b1; b = 2'b11; c = 2'b01; #10;
        a = 1'b1; b = 2'b10; c = 2'b11; #10;
        a = 1'b0; b = 2'b00; c = 2'b00; #10;

	$finish;
	end
endmodule



