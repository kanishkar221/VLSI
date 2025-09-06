module Demux1to2(
	input  in,    
	input  s,     
	output y0,    
	output y1     
);

	assign y0 = (~s) & in;

	assign y1 = s & in;
endmodule


