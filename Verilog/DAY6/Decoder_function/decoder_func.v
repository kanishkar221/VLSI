module decoder_func(
	input  [2:0] a,      
	output [7:0] y       
);

	function [7:0] decode;
		input [2:0] in;
		begin
			decode = 8'b00000000;
			decode[in] = 1'b1;   
		end
	endfunction

	assign y = decode(a);

endmodule

