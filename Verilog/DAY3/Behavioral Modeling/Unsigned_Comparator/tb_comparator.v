module tb_comparator;
	parameter W = 4;
	reg  [W-1:0] a;
	reg  [W-1:0] b;
	wire eq, lt, gt;
	
	comparator #(W) dut (
	       .a(a),
	       .b(b),
	       .eq(eq),
	       .lt(lt),
	       .gt(gt)
	);
	
	initial begin
	      	$dumpfile("comparator.vcd");
		$dumpvars(0, tb_comparator);
	end

	initial begin
		$display("time\t a\t b\t eq\t lt\t gt");
		$monitor("%0t\t %0d\t %0d\t %b\t %b\t %b", $time, a, b, eq, lt, gt);

		a = 4'd0; b = 4'd0; #5;   // equal (0 == 0)
		a = 4'd3; b = 4'd3; #5;   // equal (3 == 3)
		a = 4'd2; b = 4'd5; #5;   // a < b
		a = 4'd7; b = 4'd4; #5;   // a > b
		a = 4'd15; b = 4'd0; #5;  // max vs min (with W=4, 15 is 4'b1111)
		a = 4'd8; b = 4'd8; #5;   // equal
		a = 4'd1; b = 4'd14; #5;  // a < b
		#5 $finish;
	end
endmodule

