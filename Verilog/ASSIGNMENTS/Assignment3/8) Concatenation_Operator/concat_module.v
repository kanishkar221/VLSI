module concat_module(
	input wire a,       
	input wire [1:0] b,    
	input wire [1:0] c,
	output wire [2:0] y
	);


	assign y = {a, b[0], c[1]};
	endmodule

	
