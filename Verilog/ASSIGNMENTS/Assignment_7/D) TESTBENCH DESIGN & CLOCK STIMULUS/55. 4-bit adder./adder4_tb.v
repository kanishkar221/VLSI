module adder4_tb;
	reg [3:0] a, b;
	reg cin;
	wire [3:0] sum;
	wire cout;

	assign {cout, sum} = a + b + cin;

	task apply_inputs;
		input [3:0] ta, tb;
		input tcin;
		begin
			a = ta;
    			b = tb;
         		cin = tcin;
        		#5;
      			$display("Time=%0t | a=%b b=%b cin=%b | sum=%b cout=%b", $time, a, b, cin, sum, cout);
		end
	endtask

	initial begin
		$dumpfile("adder4_tb.vcd");
		$dumpvars(0, adder4_tb);

		$display("Time | a    b    cin | sum  cout");

		apply_inputs(4'b0000, 4'b0000, 1'b0);
		apply_inputs(4'b0101, 4'b0011, 1'b0);
      		apply_inputs(4'b1111, 4'b0001, 1'b0);
     		apply_inputs(4'b1001, 4'b0110, 1'b1);
    	  	apply_inputs(4'b1111, 4'b1111, 1'b1);

		$finish;
	end
endmodule

