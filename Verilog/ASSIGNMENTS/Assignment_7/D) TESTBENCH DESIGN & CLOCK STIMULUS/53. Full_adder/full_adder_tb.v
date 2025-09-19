module full_adder_tb;
	reg a, b, cin;
	wire sum, cout;

	assign {cout, sum} = a + b + cin;

	integer i;
	initial begin
		$dumpfile("full_adder.vcd");
		$dumpvars(0, full_adder_tb);

		$display("Time | a b cin | sum cout");

		for (i = 0; i < 8; i = i + 1) begin
			{a, b, cin} = i[2:0];   
			#5; 
			$display("%4t | %b %b  %b  |  %b    %b", $time, a, b, cin, sum, cout);
		end

	$finish;
	end
endmodule

