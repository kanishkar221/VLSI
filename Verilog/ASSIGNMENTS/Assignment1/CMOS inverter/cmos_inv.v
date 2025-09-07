module not_gate(input a, output y);
	supply0 gnd;
	supply1 vdd;

	pmos (y, vdd, a);
	cmos (y, gnd, a);
endmodule


	
