module DFF_sync (
	input wire clk,
	input wire rst_sync, 
  	input wire d,
   	output reg q
);
	always @(posedge clk) begin
		if (rst_sync)
			q <= 1'b0;
		else
			q <= d;   
	end

endmodule

