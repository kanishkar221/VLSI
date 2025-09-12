module countdown_while;
	integer count;

	initial begin
		count = 10;   
		$display("Starting countdown...");

		while (count >= 0) begin
			$display("Time=%0t | count=%0d", $time, count);
			#5 count = count - 1;  // decrement every 5 time units
		end

		$display("Countdown finished at Time=%0t", $time);
		#10 $finish;
	end
endmodule


