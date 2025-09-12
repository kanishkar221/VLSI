module ff_nonblocking;
	reg clk;
	reg q1, q2;
	always @(posedge clk) begin
		q1 <= q2;
		q2 <= q1;
		$display("Time=%0t | CLK ↑ | q1=%b q2=%b (Non-Blocking)", $time, q1, q2);
	end
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	initial begin
		q1 = 0; q2 = 1;
		$display("Init: q1=%b q2=%b", q1, q2);
		#40 $finish;
	end
endmodule

