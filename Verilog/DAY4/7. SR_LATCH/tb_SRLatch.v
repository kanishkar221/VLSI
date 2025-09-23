module tb_SRLatch;
	reg S, R;
	wire Q;

	SRLatch uut (
		.S(S),
		.R(R),
		.Q(Q)
	);

	initial begin
		$dumpfile("SRLatch.vcd");
		$dumpvars(0, tb_SRLatch);

		$monitor("Time=%0t | S=%b R=%b Q=%b", $time, S, R, Q);

		S = 0; R = 0;
		#10 S = 1; R = 0; //set
		#10 S = 0;
		#10 S = 0; R = 1; //Reset
		#10 R = 0;
		#10 S = 0; R = 0; //Hold
	
		#20 $finish;
	end

endmodule


