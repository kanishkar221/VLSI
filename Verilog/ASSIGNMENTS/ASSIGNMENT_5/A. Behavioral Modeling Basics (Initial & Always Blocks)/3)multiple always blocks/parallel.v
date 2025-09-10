module parallel (
	input  wire       clk,
	input  wire       rst_n,
	output reg  [3:0] a,
	output reg  [3:0] b,
	output wire [4:0] sum
);

	assign sum = a + b;

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n)
			a = 4'd0;
		else
			a = a + 1;     
		end
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n)
			b = 4'd0;
		else
			b = a;           
		end
endmodule

