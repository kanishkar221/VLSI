module decoder_tb;
	reg  [1:0] sel;
	wire [3:0] y;

	decoder uut (
		.sel(sel),
		.y(y)
	);

	initial begin
		 $dumpfile("decoder.vcd");
		 $dumpvars(0, decoder_tb);
	end
	
	initial begin
		 sel = 2'b00; #10;
		 sel = 2'b01; #10;
		 sel = 2'b10; #10;
		 sel = 2'b11; #10;
		 #5 $finish;
	end

	initial $monitor("time=%0t ns | sel=%b | y=%b", $time, sel, y);

endmodule


