module moore_state(
	input clk,
	input reset,
	input j,
	input k,
	output reg out
);

	parameter OFF = 1'b0;
	parameter ON  = 1'b1;
	
	reg [1:0] state, next_state;
	
	always @(posedge clk or posedge reset) begin
		if (reset)
			state <= OFF;       
		else
			state <= next_state;
	end

	always @(*) begin
		case (state)
			OFF: begin
       				if (j == 1) next_state = ON;   
				else next_state = OFF;   
			end
		
			ON: begin
         			if (k ==1) next_state = OFF;   
				else next_state = ON;   
			end
			default: next_state = OFF;
		endcase
	end
	
	always @(*) begin
		case (state)
			OFF: out = 1'b0;
			ON:  out = 1'b1;
		default: out = 1'b0;
		endcase
	end
endmodule

