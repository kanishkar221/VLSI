module nonoverlap_tb;
	reg clk,rst,x;
	wire y;
  
	nonoverlap uut(.clk(clk), .rst(rst), .x(x), .y(y));

	initial clk = 0;   
	always #5 clk = ~clk;
    
	initial begin
		$dumpfile("nonoverlap.vcd");
		$dumpvars(0, nonoverlap_tb);

		$monitor ("Time = %0t | clk = %b | rst = %b | state = %b | next_state = %b | x = %b | y = %b " , $time,clk,rst,uut.state,uut.next_state,x,y);
		
		x = 0;
		#5 rst = 1;
		#5 rst = 0;
    
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 $finish;
		
	end
endmodule



