module nonblocking;
	reg a, b;

	initial begin
	$monitor("time=%0t : a=%b, b=%b", $time, a, b);

	a = 0;
        b = 0;

        #5;
        a <= 1;
        b <= a;

        #5;
        a <= 0;
        b <= a;

        #5 $finish;
    end
endmodule

