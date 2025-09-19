module finish_50;
	reg clk;
	initial begin;
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		$display("Simulation Started ..");
		#50;
		$display("Time=%0t Simulation Ending ", $time);
		$finish;
	end
endmodule

	
