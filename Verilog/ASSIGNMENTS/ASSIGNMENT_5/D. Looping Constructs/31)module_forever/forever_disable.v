module forever_disable;
	reg clk;

	initial begin : forever_block 
		clk = 0;
		forever begin
			#5 clk = ~clk;
			$display("Time=%0t | clk=%b", $time, clk);
		end
	end
	initial begin
		#50 disable forever_block;
		$display("Forever loop disabled at Time=%0t", $time);
		#10 $finish;
	end
endmodule
			
