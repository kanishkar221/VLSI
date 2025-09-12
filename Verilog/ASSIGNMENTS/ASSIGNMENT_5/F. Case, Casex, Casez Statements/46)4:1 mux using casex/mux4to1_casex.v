module mux4to1_casex (
	input  [1:0] sel,   
	input  a, b, c, d,  
	output reg y        
);

	always @(*) begin
		casex (sel)
    			2'b0x: y = a; 
         		2'b10: y = c;  
          		2'b11: y = d; 
	        	default: y = 1'bx; 
		endcase
	end
endmodule

