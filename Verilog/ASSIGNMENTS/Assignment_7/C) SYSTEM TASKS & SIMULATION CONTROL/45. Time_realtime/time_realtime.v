module real_realtime;
	reg clk;
	reg r_time;

	initial begin;
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		$display ("Time(integer) | Realtime(real) | Clock");

		repeat(6)begin
			#3;
			r_time = $realtime;
			$display("Time=%0t | %0f | %b", $time, r_time, clk);
		end
	$finish;
	end
endmodule

