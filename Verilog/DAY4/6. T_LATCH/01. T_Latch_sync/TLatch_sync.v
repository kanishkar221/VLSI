module TLatch_sync (
	input wire clk,     
  	input wire t,       
  	input wire en,      
   	input wire reset,   
   	output reg q
);

	always @(posedge clk) begin
		if (reset)
     			q <= 1'b0;         
   		else if (en) begin
 			if (t)
        			q <= ~q;       
    			else
        			q <= q;        
   		end
	end
endmodule

