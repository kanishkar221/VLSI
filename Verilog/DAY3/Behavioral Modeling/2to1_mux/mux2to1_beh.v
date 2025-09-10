module mux2to1_beh(
	input i0,    
	input i1,    
	input sel,   
	output reg y 
);

	always @(*) begin
        
	if(sel == 0) 
            y = i0; 
        else 
            y = i1; 
    end
endmodule


