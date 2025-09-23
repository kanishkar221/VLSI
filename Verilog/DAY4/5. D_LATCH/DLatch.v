module DLatch (
	input wire d,    
	input wire en,   
	output reg q     
);
	always @(*) begin
		if (en)
			q = d;        
	end
endmodule

