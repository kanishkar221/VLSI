module stop;
	reg clk;

	initial begin
		clk = 0;
		$monitor("TIME=%0t | clk=%b",$time,clk);
	end

	always #5 clk = ~clk;

	initial begin
		#20 $stop;  
		#5 $finish;
	end
endmodule

