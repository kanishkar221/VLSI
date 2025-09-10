module tb_toggle;
	wire out;
	toggle uut (.out(out));

	initial begin
		$dumpfile("toggle.vcd");
		$dumpvars(0, tb_toggle);
		$monitor("%0t ns : out = %b", $time, out);
		#100 $finish;
	end
endmodule

