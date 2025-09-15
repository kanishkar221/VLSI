module SRFF_sync (
	input wire clk,
	input wire rst_sync, 
	input wire set_sync, 
	input wire s, r,
	output reg q
);
	always @(posedge clk) begin
		if (rst_sync)
			q <= 1'b0;
		else if (set_sync)
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

