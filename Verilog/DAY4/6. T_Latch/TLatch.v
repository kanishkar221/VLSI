module TLatch (
	input wire t,     
	input wire en,    
	output reg q      
);

	always @(*) begin
		if (en) begin
			if (t)
  				q = ~q;  
			else
				q = q;    
		end
	end
endmodule

