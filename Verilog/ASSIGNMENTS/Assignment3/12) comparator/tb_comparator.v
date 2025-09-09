module tb_comparator;
	reg  [8:0] a, b;     
	wire       ceq, clt, cgt;
	comparator #(.N(9)) uut (
		 .a(a),
		 .b(b),
		 .ceq(ceq),
		 .clt(clt),
		 .cgt(cgt)
	);
	initial begin
		$dumpfile("comparator.vcd");
		$dumpvars(0, tb_comparator);
		$display("time\t a\t\t b\t\t ceq clt cgt");
		$monitor("%0t\t %b %b %b   %b   %b", $time, a, b, ceq, clt, cgt);
		a = 9'b000000000; b = 9'b000000000; #10; 
		a = 9'b000000001; b = 9'b000000010; #10; 
		a = 9'b000001000; b = 9'b000000111; #10; 
		a = 9'b101010101; b = 9'b101010101; #10; 
		a = 9'b111111111; b = 9'b011111111; #10; 
		a = 9'b000000000; b = 9'b111111111; #10; 
		a = 9'b000110011; b = 9'b000110100; #10; 
		a = 9'b001111000; b = 9'b001110111; #10; 

		$finish;
		end
endmodule


