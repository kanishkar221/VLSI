module y_test;
	reg [5:0] y;

	initial begin
		y = 6'h2;
	        $display("y (binary) = %b", y);
                $display("y (hex)    = %h", y);
                $display("y (decimal)= %0d", y);
	        $dumpfile("y.vcd");
	        $dumpvars(0, y_test);
                #1 $finish;
                end
		endmodule



