module register_func (
	input clk, rst_n, load,
	input [3:0] d,
	output reg [3:0] q
);

	function [3:0] next_val;
		input [3:0] data, prev;
 		input load_en, rst_in;
     		begin
       			if (!rst_in)       next_val = 4'b0000;  
       			else if (load_en)  next_val = data;     
        		else               next_val = prev;     
       		end
	endfunction

	always @(posedge clk or negedge rst_n)
		q <= next_val(d, q, load, rst_n);

endmodule

