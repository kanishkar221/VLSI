module tb_decoder_func;
	reg  [2:0] a;
	wire [7:0] y;

	decoder_func uut (.a(a), .y(y));

	task apply_input;
		input [2:0] val;
		begin
   			a = val;
      			#5;  
           		$display("T=%0t | a=%b (%0d) ==> y=%b", $time, a, a, y);
 		end
	endtask

	initial begin
		$display("---- Decoder Test ----");
     		apply_input(3'b000);
      		apply_input(3'b001);
      		apply_input(3'b010);
      		apply_input(3'b011);
    		apply_input(3'b100);
      		apply_input(3'b101);
      		apply_input(3'b110);
      		apply_input(3'b111);
      		#10 $finish;
  	end
endmodule

