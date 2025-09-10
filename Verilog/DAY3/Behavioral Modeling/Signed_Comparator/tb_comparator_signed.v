module tb_comparator_signed;

	reg  signed [3:0] a, b;  
	wire eq, lt, gt;   
	comparator_signed #(4) uut (
		.a(a),
		.b(b),
		.eq(eq),
		.lt(lt),
		.gt(gt)
	);
	initial begin
		$dumpfile("comparator_signed.vcd");
		$dumpvars(0, tb_comparator_signed);
	end

	initial begin
		$display("time\t a\t b\t eq\t lt\t gt");
		$monitor("%0t\t %0d\t %0d\t %b\t %b\t %b", $time, a, b, eq, lt, gt);
		a = 4'b0111; b = 4'b1000; #5;   
		a = 4'b1000; b = 4'b0111; #5;   
		a = 4'b1010; b = 4'b1010; #5;   
		a = 4'b0101; b = 4'b0011; #5;   
		a = 4'b1111; b = 4'b1110; #5;   

		#5 $finish;
		end

endmodule

							      
