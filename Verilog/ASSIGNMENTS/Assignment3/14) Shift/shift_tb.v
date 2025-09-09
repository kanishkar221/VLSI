`timescale 1ns/1ps
module shift_tb;
	reg [3:0] in;
	wire [3:0] out1, out2;

	shift uut(in, out1, out2);

	initial begin
	$monitor("Time=%0t | IN=%b OUT1(Left)=%b OUT2(Right)=%b", $time, in, out1, out2);

	in = 4'b1011; #10;   
	in = 4'b1111; #10;
	in = 4'b0111; #10;
	in = 4'b1110; #10;
	in = 4'b0110; #10;

	$finish;
	end
endmodule


