module tb_rep_module;
	reg  a;
	reg  [1:0] b;
	reg  [1:0] c;
	wire [5:0] y;

	rep_module uut (
	       .a(a),
	       .b(b),
	       .c(c),
	       .y(y)
  	 );
	initial begin
		$dumpfile("rep_module.vcd");
		$dumpvars(0, tb_rep_module);
		$display("Time\t a \t b \t c \t y[5:0]");
		$monitor("%0t\t %b \t %b \t %b \t %b", $time, a, b, c, y);

		a = 1'b0; b = 2'b01; c = 2'b10; #10;  
		a = 1'b1; b = 2'b11; c = 2'b01; #10;
		a = 1'b1; b = 2'b10; c = 2'b11; #10;
		a = 1'b0; b = 2'b00; c = 2'b00; #10;

		$finish;
		end
endmodule

