`timescale 1ns/1ps

module tb;
	reg A, B;
	wire Y_and, Y_or, Y_nand, Y_nor, Y_xor, Y_xnor;


	and_via_mux  U_and (.A(A), .B(B), .Y(Y_and));
	or_via_mux   U_or  (.A(A), .B(B), .Y(Y_or));
	nand_via_mux U_nand(.A(A), .B(B), .Y(Y_nand));
	nor_via_mux  U_nor (.A(A), .B(B), .Y(Y_nor));
	xor_via_mux  U_xor (.A(A), .B(B), .Y(Y_xor));
	xnor_via_mux U_xnor(.A(A), .B(B), .Y(Y_xnor));

	integer i;

	initial begin
	$dumpfile("mux_gates.vcd");
	$dumpvars(0, tb);

	$display("Time  A B | AND OR NAND NOR XOR XNOR");

	for (i = 0; i < 4; i = i + 1) begin
		{A, B} = i;   
		#1;           
		$display("%4t   %b %b |  %b   %b    %b    %b   %b    %b", $time, A, B, Y_and, Y_or, Y_nand, Y_nor, Y_xor, Y_xnor);
		end

		#1 $finish;
		end
endmodule

