module TFF_sync (
	input wire clk,
	input wire rst_sync, 
	input wire t,
	output reg q
);

	always @(posedge clk) begin
		if (rst_sync)
			q <= 1'b0;       
		else if (t)
			q <= ~q;         
		else
			q <= q;          
	end

endmodule

