module tb_priority_select;
	reg a, b, c;
	wire y;
	priority_select uut(.a(a), .b(b), .c(c), .y(y));

	initial begin
		$dumpfile("priority_wave.vcd");
		$dumpvars(0, tb_priority_select);
		$monitor("Time=%0t | a=%b b=%b c=%b --> y=%b", $time, a, b, c, y);

		a=0; b=0; c=0; #10;  
	        a=0; b=0; c=1; #10;  
	        a=0; b=1; c=0; #10;  
	        a=1; b=0; c=0; #10;  
	        a=1; b=1; c=1; #10;  
	        a=0; b=1; c=1; #10;  
        
        #50 $finish;
    end
endmodule

