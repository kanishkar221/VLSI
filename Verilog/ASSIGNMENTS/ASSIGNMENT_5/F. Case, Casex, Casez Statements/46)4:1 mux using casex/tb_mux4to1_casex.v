module tb_mux4to1_casex;
	reg a, b, c, d;
	reg [1:0] sel;
	wire y;

	mux4to1_casex uut (
		.sel(sel),
		.a(a),
      		.b(b),
     		.c(c),
      		.d(d),
     		.y(y)
	);

	initial begin
		$monitor("Time=%0t | sel=%b | a=%b b=%b c=%b d=%b | y=%b", $time, sel, a, b, c, d, y);
		a = 1; b = 0; c = 1; d = 0;
      		sel = 2'b00; #10;   
      		sel = 2'b01; #10;   
     		sel = 2'b10; #10;   
      		sel = 2'b11; #10;   
      		sel = 2'b0x; #10;   

		$finish;
	end

	initial begin
		$dumpfile("mux4to1_casex.vcd");
      		$dumpvars(0, tb_mux4to1_casex);
  	end
endmodule

