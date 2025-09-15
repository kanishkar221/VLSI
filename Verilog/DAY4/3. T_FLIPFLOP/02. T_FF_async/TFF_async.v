module TFF_async (
	input wire clk,
	input wire rst_async, 
	input wire t,
	output reg q
);

	always @(posedge clk or posedge rst_async) begin
		if (rst_async)
			q <= 1'b0;       
		else if (t)
			q <= ~q;         
		else
			q <= q;          
	end

endmodule

