module blocking_dff (
	input  wire clk,
	input  wire rst_n,
	input  wire d,
	output reg  q
);
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n)
			q = 0;   
		else
			q = d;   
		end

endmodule

