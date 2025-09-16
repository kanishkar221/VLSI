module reg_array_generate_tb;
	wire [7:0] a;

	reg_array_generate uut(.a(a));

	initial begin
		$dumpfile("reg_array_generate.vcd");   // for GTKWave
		$dumpvars(0, reg_array_generate_tb);   // dump all signals
		#5  $display("Regs initialized to zeros: reg value = %b", a);
		#10 $finish;
	end
endmodule


