module more_than_one(
	input clk,
	input rst,
	input in,
	output reg out
);

	reg [2:0]state, next_state;
	parameter S0=0;
	parameter S1=1;
	parameter S2=2;
	parameter S3=3;
	parameter S4=4;
	parameter S5=5;
	parameter S6=6;
	parameter S7=7;

	always@(posedge clk or posedge rst) begin
		if(rst)
			state <= S0;
		else
			state <= next_state;
	end

	always @ (in or state)
	begin
	case(state)
		S0:begin
			if(in)begin
				next_state = S1;
			end
			else begin
				next_state = S0;
			end
			out = 0;
		end

		S1:begin
			if(in)begin
                                next_state = S3;
			end
			else begin
                                next_state = S2;
			end
                        out = 0;
                end

		S2:begin
			if(in) begin
                                next_state = S5;
			end
			else begin
                                next_state = S4;
			end
                        out = 0;
                end

		S3:begin
                        if(in)begin
                                next_state = S7;
			end
			else begin
                                next_state = S6;
			end
                        out = 1;
                end

		S4:begin
			if(in) begin
                                next_state = S1;
			end
			else begin
                                next_state = S0;
			end
                        out = 0;
                end

		S5:begin
			if(in) begin
                                next_state = S3;
			end
			else begin
                                next_state = S2;
			end
                        out = 1;
                end

		S6:begin
			if(in)begin
                                next_state = S5;
		           end
			   else begin
                                next_state = S4;
			end
                        out = 1;
                end

		S7:begin
			if(in) begin
                                next_state = S7;
			end
			else begin
                                next_state = S6;
			end
                        out = 1;
                end

		default: next_state = S0;
	endcase
end
endmodule

