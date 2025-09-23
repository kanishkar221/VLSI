module JKLatch (
	input wire J,
	input wire K,
	input wire en,   
	output reg Q
);

	always @(*) begin
		if (en) begin
			case ({J, K})
				2'b00: Q = Q;      
				2'b01: Q = 1'b0;    
      				2'b10: Q = 1'b1;    
   		     		2'b11: Q = ~Q;      
		endcase
	end
end
endmodule

