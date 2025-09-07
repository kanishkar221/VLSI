module mux4to1 (
    input  wire i0, i1, i2, i3,   
    input  wire s1, s0,           
    output wire y                 

);
	wire ns1, ns0;
	not (ns1, s1);
	not (ns0, s0);

	wire a, b, c, d;
	and (a, i0, ns1, ns0);
	and (b, i1, ns1, s0);   
	and (c, i2, s1, ns0);   
	and (d, i3, s1, s0);
	or (y, a, b, c, d);

endmodule


    
