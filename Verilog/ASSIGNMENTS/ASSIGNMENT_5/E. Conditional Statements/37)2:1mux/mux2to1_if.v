module mux2to1_if (
	input wire a,      // input 0
	input wire b,      // input 1
	input wire sel,    // select line
	output reg y       // output
);
	always @(*) begin
		if (sel == 1'b0)
			y = a;
		else
		        y = b;
	end
endmodule

