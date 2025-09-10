module tb_reg16;
	wire [15:0] out;
	reg16 uut (.out(out));

	initial begin
		$dumpfile("reg16.vcd");
		$dumpvars(0, tb_reg16);
		$monitor("%0t ns : out = 0x%h (%0d)", $time, out, out);
		#200 $finish;
	end
endmodule

