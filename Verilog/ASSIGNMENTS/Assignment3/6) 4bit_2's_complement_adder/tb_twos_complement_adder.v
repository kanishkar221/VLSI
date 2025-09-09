module tb_twos_complement_adder;

	reg x, y;
	reg c_in;
	wire sum;
	wire c_out;


	twos_complement_adder uut (
		 .x(x),
		 .y(y),
		 .c_in(c_in),
		 .sum(sum),
		 .c_out(c_out)
	);

	initial begin
		
	       $display("Time\t x\t y\t c_in\t sum\t c_out");
	       $monitor("%0t\t %b\t %b\t %b\t %b\t %b", $time, x, y, c_in, sum, c_out);
		
		x = 4'b0011; y = 4'b0101; c_in = 1'b0; #10; 
		x = 4'b0110; y = 4'b0011; c_in = 1'b0; #10; 
		x = 4'b0101; y = 4'b0010; c_in = 1'b1; #10; 
		x = 4'b1001; y = 4'b0110; c_in = 1'b1; #10;

		$finish;
	end
	endmodule


