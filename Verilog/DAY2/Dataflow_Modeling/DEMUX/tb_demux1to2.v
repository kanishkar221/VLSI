module tb_demux1to2;
	reg in, s;
	wire y0, y1;

	Demux1to2 uut ( .in(in), .s(s), .y0(y0), .y1(y1));
	initial begin
	$dumpfile("demux_wave.vcd");
	$dumpvars(0, tb_demux1to2);
	$display(" s  in | y0 y1");
	$monitor(" %b  %b |  %b  %b", s, in, y0, y1);

	s = 0; in = 0; #10;   // expect y0=0, y1=0
	s = 0; in = 1; #10;   // expect y0=1, y1=0
	s = 1; in = 0; #10;   // expect y0=0, y1=0
	s = 1; in = 1; #10;   // expect y0=0, y1=1

	$finish;
	end
endmodule




	
