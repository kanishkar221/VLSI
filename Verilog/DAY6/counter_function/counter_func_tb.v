module counter_func_tb;
	reg clk, rst_n, en, dir;
	wire [3:0] q;

	counter_func uut (.clk(clk), .rst_n(rst_n), .en(en), .dir(dir), .q(q));
	
	initial clk = 0;
	always #5 clk = ~clk;

	task reset_counter;
		begin
			rst_n = 0; en = 0; dir = 1;
       			#10; rst_n = 1;
    		end
	endtask

	task do_count;
		input integer n;
		input reg dir_in;
		begin
			dir = dir_in; en = 1;
			repeat(n) @(posedge clk);
 			en = 0;
     		end
	endtask

    	initial begin
		$display("---- Simple Counter Test ----");
    		reset_counter;
      		do_count(5, 1);  
     		do_count(3, 0);  
     	 	#20 $finish;
 	end

	always @(posedge clk)
		$display("T=%0t | q=%0d", $time, q);
endmodule

