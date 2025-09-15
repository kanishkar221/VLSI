module DFF_async (
	input wire clk,
  	input wire rst_async,
   	input wire d,
   	output reg q
);

	always @(posedge clk or posedge rst_async) begin
		if (rst_async)
			q <= 1'b0; 
		else
			q <= d;    
	end

endmodule

