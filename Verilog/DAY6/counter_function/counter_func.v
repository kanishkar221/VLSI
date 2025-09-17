module counter_func(
	input  wire clk,
	input  wire rst_n,  
	input  wire en,     
	input  wire dir,    
	output reg [3:0] q  
);

	function [3:0] next_count;
		input [3:0] curr;
		input dir_in, en_in;
		begin
			if (!en_in)
				next_count = curr;
			else if (dir_in)
				next_count = curr + 1;
			else
				next_count = curr - 1;
		end
	endfunction

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n)
			q <= 4'b0000;
		else
			q <= next_count(q, dir, en);
	end
endmodule

