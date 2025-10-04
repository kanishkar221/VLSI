module moore_state_tb;
	reg clk;
	reg reset;
	reg j;
	reg k;
	wire out;
	
	moore_state uut (
		.clk(clk),
 		.reset(reset),
   		.j(j),
   		.k(k),
     		.out(out)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
		
	initial begin
        	$dumpfile("moore_state.vcd");
		$dumpvars(0, moore_state_tb);
		$monitor("Time=%0t | j=%b k=%b | out=%b", $time, j, k, out);
  		
		clk = 0;
		reset = 1;
    		j = 0;
   		k = 0;
		#10 reset = 0;
		#10 j = 1;
  		#10 j = 0;
		#20;
		
		k = 1;
		#10 k = 0;
		#10 j = 1; #10 j = 0;
    		#10 k = 1; #10 k = 0;
		#20 $finish;
	end
endmodule

