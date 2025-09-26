module sequence_detect(
	input clk,
	input reset,
	input x,
	output y
);
	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;

	reg [2:0] state, next_state;
	always @(posedge clk ) begin
		if(!reset)
			state <= S0;
		else
			state <= next_state;
	end

	always @(state or x) begin
		case(state)
			S0 : begin
				if (x==0) next_state = S1;
				else next_state = S3;
			end
		
                        S1 : begin
                                if (x==0) next_state = S2;
                                else next_state = S3;
			end
		
                        S2 : begin
                                if (x==0) next_state = S2;
                                else next_state = S3;
			end
		
                        S3 : begin
                                if (x==1) next_state = S4;
                                else next_state = S1;
			end
		
                        S4 : begin
                                if (x==1) next_state = S4;
                                else next_state = S1;
			end
			default : next_state = S0;
		endcase
	end
	assign y = ((state == S2) && (x == 1)) || ((state == S4) && ( x == 1)) ? 1:0;
endmodule
	
