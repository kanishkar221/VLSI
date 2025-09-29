module Traffic_Light_Controller(
	input clk,
	input reset,
	output reg [2:0] light_M1,
	output reg [2:0] light_MT,
	output reg [2:0] light_M2,
	output reg [2:0] light_S
);
	parameter s1 = 0, s2 = 1, s3 = 2, s4 = 3, s5 = 4, s6 = 5;
	parameter sec7 = 7, sec2 = 2, sec5 = 5, sec3 = 3;
	reg [3:0] count;
	reg [2:0] ps;

	always@(posedge clk or posedge reset)
		begin
		if(reset == 1)
			begin
			ps<=s1;
			count<=0;
		end
		else

			case(ps)
				s1: if(count<sec7)
					begin
					ps<=s1;
					count<=count + 1;
					end
				    else
					begin
                                        ps<=s2;
                                        count<=0;
                                        end
				s2: if(count<sec2)
                                        begin
                                        ps<=s2;
                                        count<=count + 1;
                                        end
                                    else
                                        begin
                                        ps<=s3;
                                        count<=0;
                                        end
				s3: if(count<sec5)
                                        begin
                                        ps<=s3;
                                        count<=count + 1;
                                        end
                                    else
                                        begin
                                        ps<=s4;
                                        count<=0;
                                        end
				s4: if(count<sec2)
                                        begin
                                        ps<=s4;
                                        count<=count + 1;
                                        end
                                    else
                                        begin
                                        ps<=s5;
                                        count<=0;
                                        end
				s5: if(count<sec3)
                                        begin
                                        ps<=s5;
                                        count<=count + 1;
                                        end
                                    else
                                        begin
                                        ps<=s6;
                                        count<=0;
                                        end
				s6: if(count<sec2)
                                        begin
                                        ps<=s6;
                                        count<=count + 1;
                                        end
                                    else
                                        begin
                                        ps<=s1;
                                        count<=0;
                                        end
				default: ps<=s1;
				endcase
			end
			
			always@(ps)
			begin
				case(ps)
					s1:
					begin
						light_M1<=3'b001;
						light_M2<=3'b001;
						light_MT<=3'b100;
						light_S<=3'b100;
					end
					s2:
                                        begin
                                                light_M1<=3'b001;
                                                light_M2<=3'b010;
                                                light_MT<=3'b100;
                                                light_S<=3'b100;
                                        end
					s3:
                                        begin
                                                light_M1<=3'b001;
                                                light_M2<=3'b100;
                                                light_MT<=3'b001;
                                                light_S<=3'b100;
                                        end
					s4:
                                        begin
                                                light_M1<=3'b010;
                                                light_M2<=3'b100;
                                                light_MT<=3'b010;
                                                light_S<=3'b100;
                                        end
					s5:
                                        begin
                                                light_M1<=3'b100;
                                                light_M2<=3'b100;
                                                light_MT<=3'b100;
                                                light_S<=3'b001;
                                        end
					s6:
                                        begin
                                                light_M1<=3'b100;
                                                light_M2<=3'b100;
                                                light_MT<=3'b100;
                                                light_S<=3'b010;
                                        end
					default
					begin
                                                light_M1<=3'b000;
                                                light_M2<=3'b000;
                                                light_MT<=3'b000;
                                                light_S<=3'b000;
                                        end
					endcase
			end
endmodule

				

	
					
