module mux_nested_tb;
	reg i0, i1, i2, i3, s0, s1;
	wire y;

	mux_nested uut(
		.i0(i0), 
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.s0(s0), 
		.s1(s1), 
		.y(y)
	 );

	initial begin
	$dumpfile("Mux_nested.vcd");   // for waveform
	$dumpvars(0, mux_nested_tb);
	$display("TIME | i0 i1 i2 i3 s1 s0 | y");
	$monitor("%4t |  %b  %b  %b  %b  %b  %b | %b", $time, i0, i1, i2, i3, s1, s0, y);

 	i0=1; i1=0; i2=0; i3=0; s1=0; s0=0; #10; 
	i0=0; i1=1; i2=0; i3=0; s1=0; s0=1; #10; 
	i0=0; i1=0; i2=1; i3=0; s1=1; s0=0; #10; 
	i0=0; i1=0; i2=0; i3=1; s1=1; s0=1; #10; 

	$finish;
	end
endmodule


