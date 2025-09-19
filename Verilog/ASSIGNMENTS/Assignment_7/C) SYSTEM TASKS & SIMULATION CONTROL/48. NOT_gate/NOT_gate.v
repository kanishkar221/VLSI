module NOT_gate;
	reg a;
	wire y;

	assign y = ~a;
	initial begin
		$dumpfile("NOT_gate.vcd");
		$dumpvars(0, NOT_gate);
		
		$monitor("Time=%0t a=%b --> y=%b", $time, a, y);
		a = 0;
		#10 a = 1;
		#10 a = 0;
		#10 a = 1;
		#10 $finish;
	end
endmodule

		
