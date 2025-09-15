module SRFF_async (
	input wire clk,
	input wire rst_async,  
	input wire set_async,  
	input wire s, r,       
	output reg q
);

	always @(posedge clk or posedge rst_async or posedge set_async) begin
		if (rst_async)
			q <= 1'b0;   
		else if (set_async)
			q <= 1'b1;   
		else begin
			case ({s,r})
				2'b10: q <= 1'b1; 
				2'b01: q <= 1'b0; 
				2'b00: q <= q;    
				2'b11: q <= 1'b0; 
			endcase
		end
end

endmodule

