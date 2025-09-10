module priority_encoder_tb;
	reg  [3:0] d;
	wire [1:0] y;
	wire valid;

	priority_encoder uut (
		 .d(d),
		 .y(y),
		 .valid(valid)
	);

	initial begin
	  	$dumpfile("priority_encoder.vcd");
	       $dumpvars(0, priority_encoder_tb);
	end

	initial begin
	       d = 4'b0000; #10;   
	       d = 4'b0001; #10;   
	       d = 4'b0010; #10;   
	       d = 4'b0100; #10;   
	       d = 4'b1000; #10;   
	       d = 4'b0110; #10;   
	       d = 4'b1011; #10;   
	       #5 $finish;
	end
	initial $monitor("time=%0t ns | d=%b | y=%b | valid=%b", $time, d, y, valid);

endmodule

