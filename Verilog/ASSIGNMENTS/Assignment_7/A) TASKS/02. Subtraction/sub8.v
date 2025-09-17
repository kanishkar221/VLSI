module sub8;
	reg  [7:0] a, b;
        reg  [8:0] diff;
	integer i;

	wire [7:0] diff_low8;
	wire       borrow;
	wire signed [8:0] signed_diff;

	assign diff_low8   = diff[7:0];
	assign borrow      = diff[8];
	assign signed_diff = diff;

	task sub8_task;
		input  [7:0] x;
		input  [7:0] y;
		output [8:0] d;
		begin
			d = {1'b0, x} - {1'b0, y};
		end
	endtask

	initial begin
		$dumpfile("sub8.vcd");
		$dumpvars(0, sub8);

		$monitor("Time=%0t : a=%0d b=%0d diff_low8=%0d borrow=%b signed_diff=%0d", $time, a, b, diff_low8, borrow, signed_diff);

		a = 8'd50; b = 8'd20; #1;
		sub8_task(a, b, diff);

		a = 8'd20; b = 8'd50; #1;
		sub8_task(a, b, diff);

		a = 8'd0; b = 8'd1; #1;
		sub8_task(a, b, diff);

		for (i = 0; i < 4; i = i + 1) begin
			a = $random;
			b = $random;
			#1 sub8_task(a, b, diff);
		end
		#1 $finish;
	end
endmodule

								    
