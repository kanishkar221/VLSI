module divisible_by_5(
	input clk,
	input reset,
	input serial_in,
	output reg out
);
	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;

	reg [2:0] state, next_state;
	always @(posedge clk ) begin
		if(reset)
			state <= S0;
		else
			state <= next_state;
	end

	always @(state or serial_in) begin
		case(state)
			S0: next_state = (serial_in) ? S1 : S0;
			S1: next_state = (serial_in) ? S3 : S2;
        		S2: next_state = (serial_in) ? S0 : S4;
      			S3: next_state = (serial_in) ? S2 : S1;
    			S4: next_state = (serial_in) ? S4 : S3;
			
			default: next_state = S0;
		endcase
	end
	always @(*) begin
		case (state)
			S0: out = 1;  
			default: out = 0;
		endcase
	end

endmodule

