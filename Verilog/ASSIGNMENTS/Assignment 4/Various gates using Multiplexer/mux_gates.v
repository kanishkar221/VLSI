module mux2 (
	input  wire sel,
	input  wire d0,
	input  wire d1,
	output wire y
);
	assign y = sel ? d1 : d0;
endmodule

// AND:(A & B)
module and_via_mux(input A, input B, output Y);
mux2 m(.sel(A), .d0(1'b0), .d1(B), .y(Y));
endmodule

// OR:(A | B)
module or_via_mux(input A, input B, output Y);
  mux2 m(.sel(A), .d0(B), .d1(1'b1), .y(Y));
endmodule

// NAND: ~(A & B)
module nand_via_mux(input A, input B, output Y);
  mux2 m(.sel(A), .d0(1'b1), .d1(~B), .y(Y));
endmodule

// NOR: ~(A | B)
module nor_via_mux(input A, input B, output Y);
  mux2 m(.sel(A), .d0(~B), .d1(1'b0), .y(Y));
endmodule

// XOR: A ^ B
module xor_via_mux(input A, input B, output Y);
  mux2 m(.sel(A), .d0(B), .d1(~B), .y(Y));
endmodule

// XNOR: A ~^ B
module xnor_via_mux(input A, input B, output Y);
  mux2 m(.sel(A), .d0(~B), .d1(B), .y(Y));
endmodule

