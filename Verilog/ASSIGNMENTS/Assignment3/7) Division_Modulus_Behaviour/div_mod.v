module div_mod(
	input a, b,         
	input  signed sa, sb,
	output div_out, mod_out,   
	output signed sdiv_out, smod_out 
);

	assign div_out  = a / b;     
	assign mod_out  = a % b;
	assign sdiv_out = sa / sb;
	assign smod_out = sa % sb;

endmodule



	
