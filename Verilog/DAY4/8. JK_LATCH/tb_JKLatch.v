module tb_JKLatch;
	reg J, K, en;
	wire Q;

	JKLatch uut (
		.J(J),
		.K(K),
		.en(en),
		.Q(Q)
	);
	
	initial begin
		$dumpfile("JKLatch.vcd");
		$dumpvars(0, tb_JKLatch);

		$monitor("Time=%0t | J=%b K=%b en=%b Q=%b", $time, J, K, en, Q);	
		#10 en = 0; J = 1; K = 1;
		#10 en = 1; J = 0; K = 0;  // Hold
		#10 J = 0; K = 1;           // Reset
		#10 J = 1; K = 0;           // Set
		#10 J = 1; K = 1;           // Toggle
		#10 J = 1; K = 1;           // Toggle again
		#10 J = 0; K = 0;           // Hold
		
		$finish;
	end
endmodule

