module not_gate(output out, input in);
	supply0 a;  
	supply1 b;  
	        
	pmos (out, b, in);
	nmos (out, a, in);
endmodule




