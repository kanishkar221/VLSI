module dff_async_reset_tb;
	reg clk, reset, d;
	reg q;

	always @(posedge clk or posedge reset) begin
		if (reset)
			q <= 1'b0;  
		else
			q <= d;     
	end

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		$dumpfile("dff_async_reset.vcd");
		$dumpvars(0, dff_async_reset_tb);

     		reset = 0; d = 0;
      		#5  reset = 1;         
      		#7  reset = 0; d = 1;  
      		#10 d = 0;             
      		#20 d = 1;             
      		#5  reset = 1;         
     		#20 reset = 0;         
      		#20 $finish;           
	end

	initial begin
		$monitor("Time=%0t | clk=%b reset=%b d=%b | q=%b",$time, clk, reset, d, q);
    end
endmodule

