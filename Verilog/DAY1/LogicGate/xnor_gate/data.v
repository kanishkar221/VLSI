module xnor_gate(a,b,o);
 	input a,b;
	output o;
	assign o=~(a^b); 
endmodule

