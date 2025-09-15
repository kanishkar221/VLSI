module JKFF_sync (
	input wire clk,
	input wire rst_sync, 
	input wire set_sync, 
	input wire j, k,
	output reg q
);

	always @(posedge clk) begin
		if (rst_sync)
			q <= 1'b0;     
		else if (set_sync)
			q <= 1'b1;     
		else begin
			case ({j,k})
				2'b00: q <= q;    
				2'b10: q <= 1'b1; 
				2'b01: q <= 1'b0; 
				2'b11: q <= ~q;   
			endcase
		end
	end

endmodule

