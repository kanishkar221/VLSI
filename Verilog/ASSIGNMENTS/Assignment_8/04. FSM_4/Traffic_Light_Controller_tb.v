module Traffic_Light_Controller_tb;

	reg clk;
        reg reset;
	wire [2:0] light_M1;
	wire [2:0] light_M2;
	wire [2:0] light_MT;
	wire [2:0] light_S;

	Traffic_Light_Controller dut (
		.clk(clk),
		.reset(reset),
		.light_M1(light_M1),
		.light_M2(light_M2),
		.light_MT(light_MT),
		.light_S(light_S)
	);

	parameter CLK_PERIOD = 10; 
	initial begin
		clk = 1'b0;
		forever #(CLK_PERIOD/2) clk = ~clk;
	end

	initial begin
		reset = 1'b1;     
		#20 reset = 1'b0;
		#(CLK_PERIOD * 200);
		$finish;
	end

	initial begin
		$dumpfile("Traffic_Light_Controller_tb.vcd");
		$dumpvars(0, Traffic_Light_Controller_tb);
	end

	initial begin
		$monitor("T=%0t | reset=%b | M1=%b M2=%b MT=%b S=%b", $time, reset, light_M1, light_M2, light_MT, light_S);
	end
endmodule


