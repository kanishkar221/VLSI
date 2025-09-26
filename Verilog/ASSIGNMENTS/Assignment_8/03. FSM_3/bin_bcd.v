module bin_bcd (
	input  wire clk,
	input  wire rst,
	input  wire start,
	input  wire [7:0] bin_in,
	output reg [11:0] bcd_out,
	output reg Done
);

	parameter idle               = 3'b000;
	parameter shift              = 3'b001;
	parameter check_shift_index  = 3'b010;
	parameter add                = 3'b011;
	parameter check_digit_index  = 3'b100;
	parameter bcd_done           = 3'b101;

	reg [2:0] state, next_state;
	reg [7:0] r_bin;
	reg [3:0] Loop_Count;     
	reg [1:0] Digit_Index;  

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			state       <= idle;
			bcd_out     <= 0;
			r_bin       <= 0;
		 	Loop_Count  <= 0;
   			Digit_Index <= 0;
			Done        <= 0;
		end 
		else begin
			state <= next_state;
			case (state)
  				idle: begin
				Done <= 0;
      				if (start) begin
					r_bin       <= bin_in;
					bcd_out     <= 0;
					Loop_Count  <= 0;
					Digit_Index <= 0;
				end
			end

			shift: begin
				bcd_out <= bcd_out << 1;
				bcd_out[0] <= r_bin[7];    
				r_bin <= r_bin << 1;       
			end

			check_shift_index: begin
				if (Loop_Count == 7)
					Loop_Count <= 0;
				else
					Loop_Count <= Loop_Count + 1;
			end

			add: begin
				if (bcd_out[(Digit_Index*4)+:4] >= 5)
					bcd_out[(Digit_Index*4)+:4] <= bcd_out[(Digit_Index*4)+:4] + 3;
			end
			
			check_digit_index: begin
				if (Digit_Index == 2)
					Digit_Index <= 0;
				else
					Digit_Index <= Digit_Index + 1;
			end

			bcd_done: begin
				Done <= 1;
			end
			endcase
		end
	end
	
	always @(*) begin
		case (state)
		idle: 
			next_state = (start) ? shift : idle;

		shift: 
			next_state = check_shift_index;

		check_shift_index: 
			next_state = (Loop_Count == 7) ? bcd_done : add;

		add: 
			next_state = check_digit_index;
	
		check_digit_index: 
			next_state = (Digit_Index == 2) ? shift : add;

		bcd_done: 
			next_state = idle;

		default: 
			next_state = idle;
		endcase
	end
endmodule
			

