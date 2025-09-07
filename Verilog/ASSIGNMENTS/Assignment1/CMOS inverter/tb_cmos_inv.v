module tb_not;
	reg a;
	wire y;
	not_gate uut(.a(a), .y(y));
	initial begin
		$dumpfile("not_wave.vcd");
		$dumpvars(0, tb_not);
		$display("time | a  b | y");
		$monitor("%2t | %b | %b", $time, a, y);
		a=0; #10;
		a=1; #10;
		$finish;
		end
endmodule


