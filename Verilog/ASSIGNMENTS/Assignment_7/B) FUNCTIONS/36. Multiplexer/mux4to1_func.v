module mux4to1_func;

	reg [7:0] in0, in1, in2, in3;
  	reg [1:0] sel;
   	reg [7:0] out;

	function [7:0] mux4to1;
		input [7:0] d0, d1, d2, d3;
      		input [1:0] s;
      		begin
           		case(s)
				2'b00: mux4to1 = d0;
   	          		2'b01: mux4to1 = d1;
        			2'b10: mux4to1 = d2;
	             		2'b11: mux4to1 = d3;
				default: mux4to1 = 8'h00;
			endcase
		end
	endfunction

	initial begin
		$monitor("Time=%0t | sel=%b | out=%0d", $time, sel, out);

        
      		in0 = 8'd10;
      		in1 = 8'd20;
      		in2 = 8'd30;
      		in3 = 8'd40;

     		sel = 2'b00; out = mux4to1(in0, in1, in2, in3, sel); #10;
      		sel = 2'b01; out = mux4to1(in0, in1, in2, in3, sel); #10;
      		sel = 2'b10; out = mux4to1(in0, in1, in2, in3, sel); #10;
      		sel = 2'b11; out = mux4to1(in0, in1, in2, in3, sel); #10;

		#20 $finish;
  	end
endmodule

