module tb_encoder_func;
	reg  [7:0] y;
	wire [2:0] a;


	encoder_func uut (.y(y), .a(a));

	task apply_input;
		input [7:0] val;
   		begin
         		y = val;
          		#5; 
       			$display("T=%0t | y=%b ==> a=%b (%0d)", $time, y, a, a);
		end
	endtask

	initial begin
		$display("---- Encoder Test ----");
    		apply_input(8'b00000001); 
      		apply_input(8'b00000010);
      		apply_input(8'b00000100); 
      		apply_input(8'b00001000); 
      		apply_input(8'b00010000); 
      		apply_input(8'b00100000); 
     		apply_input(8'b01000000); 
      		apply_input(8'b10000000); 
      		#10 $finish;
  	end
endmodule

