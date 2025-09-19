module control_monitoring;
	reg a;
	wire y;

	assign y = ~a;

	initial begin
		$dumpfile("control_monitoring.vcd");
		$dumpvars(0, control_monitoring);

		$monitor("Time=%0t a=%b --> y=%b", $time, a, y);

		a = 0;
		#5 a = 1;
		
		#5 $monitoroff;
		#5 a = 0;
		#5 a = 1;

		#5 $monitoron;
		#5 a = 0;
		#10 $finish;
	end
endmodule

