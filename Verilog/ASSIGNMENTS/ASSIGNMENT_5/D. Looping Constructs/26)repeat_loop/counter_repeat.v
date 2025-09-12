module counter_repeat;
	reg [3:0] count;
	initial begin
		count = 0;
		$display("Time=%0t | count=%0d", $time, count);
		repeat (8) begin
			#5 count = count + 1;
			$display("Time=%0t | count=%0d", $time, count);
		end

		#5 $finish; 
	end
endmodule

