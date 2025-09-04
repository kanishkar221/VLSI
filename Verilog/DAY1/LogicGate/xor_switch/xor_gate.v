module xor_gate(input a, b, output y);
	wire na, nb;     
	not_gate g1(.out(na), .in(a)); 
	not_gate g2(.out(nb), .in(b));

	cmos tg1(y, a, nb, b);
	cmos tg2(y, na, b, nb);
endmodule

       
