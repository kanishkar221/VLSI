`timescale 1ns/1ps
module tb_all_detect;
	parameter N = 9;
	reg [N-1:0] x;        
	wire zero, one;
	all_detect #(N) uut (
	       .x(x),
	       .zero(zero),
	       .one(one)
	);


	initial begin
		$dumpfile("tb_all_detect.vcd");
		$dumpvars(0, tb_all_detect);
		$display("Time\tInput(x)\t zero one");
		$monitor("%0t\t%b\t %b   %b", $time, x, zero, one);

		x = 9'b000000000; #10; 
		x = 9'b000000001; #10; 
		x = 9'b000000011; #10; 
		x = 9'b101010101; #10; 
		x = 9'b111111111; #10; 
		x = 9'b111111110; #10;

		$finish;
		end
endmodule

