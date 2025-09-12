module tb_mux4to1_if;
	reg a, b, c, d;
	reg [1:0] sel;
	wire y;
	mux4to1_if uut (
		.a(a), .b(b), .c(c), .d(d),
		.sel(sel),
		.y(y)
	);
	
	initial begin
		$display("\nStarting 4:1 MUX simulation (nested if)...\n");
		$monitor("Time=%0t | sel=%b | a b c d = %b %b %b %b -> y=%b", $time, sel, a, b, c, d, y);
		a = 0; b = 1; c = 0; d = 1;
		sel = 2'b00; #10;
		sel = 2'b01; #10;
		sel = 2'b10; #10;
		sel = 2'b11; #10;

		#10;

		a = 1; b = 0; c = 1; d = 0;
		sel = 2'b00; #10;
		sel = 2'b01; #10;
		sel = 2'b10; #10;
		sel = 2'b11; #10;

		#10;
		a = 1; b = 1; c = 0; d = 0;
		sel = 2'b00; #10;
		sel = 2'b01; #10;
		sel = 2'b10; #10;
		sel = 2'b11; #10;

		$display("\nSimulation finished.\n");
		$finish;
	end
	initial begin
		$dumpfile("mux4to1_if.vcd");
		$dumpvars(0, tb_mux4to1_if);
	end
endmodule

