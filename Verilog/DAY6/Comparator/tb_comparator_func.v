module tb_comparator_func;
	reg  [3:0] a, b;
	wire lt, eq, gt;

	comparator_func uut (.a(a), .b(b), .lt(lt), .eq(eq), .gt(gt));

	task apply_stimulus;
		input [3:0] x, y;
		begin
      			a = x; b = y;
      			#5; 
       			$display("T=%0t | a=%0d, b=%0d ==> lt=%b eq=%b gt=%b", $time, a, b, lt, eq, gt);
		end
	endtask

	initial begin
		$display("---- Comparator Test ----");
		apply_stimulus(4'd5, 4'd7);   
		apply_stimulus(4'd9, 4'd9);   
		apply_stimulus(4'd12, 4'd3);  
		apply_stimulus(4'd0, 4'd15);  
		apply_stimulus(4'd8, 4'd4);   
		#10 $finish;
	end
endmodule

