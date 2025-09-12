module differentiate_behaviour;
	reg clk;
	reg sig_for, sig_repeat, sig_forever;
	integer i;
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		sig_for = 0;
		for (i = 0; i < 8; i = i + 1) begin
			#10 sig_for = ~sig_for;
		end
	end

	initial begin
		sig_repeat = 0;
		repeat (6) begin
			#15 sig_repeat = ~sig_repeat;
		end
	end

	initial begin
		sig_forever = 0;
		forever begin
			#20 sig_forever = ~sig_forever;
		end
	end

	initial begin
		#200 $finish;
	end
endmodule

