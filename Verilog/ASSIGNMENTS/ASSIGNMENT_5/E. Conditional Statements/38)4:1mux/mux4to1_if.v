module mux4to1_if (
	input  wire a,
	input  wire b,
	input  wire c,
	input  wire d,
	input  wire [1:0] sel,
	output reg  y
);
	always @(*) begin
		if (sel[1] == 1'b0) begin
			if (sel[0] == 1'b0)
				y = a;
			else
				y = b;
		end
		else begin
         
			if (sel[0] == 1'b0)
				y = c;   
          		else
				y = d;   
		end
	end
endmodule

