module tb_register_func;
	reg clk, rst_n, load;
	reg [3:0] d;
	wire [3:0] q;

	register_func uut (.clk(clk), .rst_n(rst_n), .load(load), .d(d), .q(q));

	initial clk = 0;
	always #5 clk = ~clk; 

	task reset_reg;
		begin
			rst_n = 0; load = 0; d = 0;
         		#12 rst_n = 1;  
     		end
	endtask

    
	task load_val;
		input [3:0] val;
		begin
       			@(posedge clk); d = val; load = 1;
         		@(posedge clk); load = 0; d = 0;
  		end
	endtask

    
	initial begin
		$display("---- Register Test ----");
		reset_reg;
    		load_val(4'b1010);
     		load_val(4'b1111);
   		load_val(4'b0101);
     		#20 $finish;
	end

	always @(posedge clk)
		$display("T=%0t | d=%b | q=%b", $time, d, q);

endmodule

