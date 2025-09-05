module wire_reg_demo;
	wire net1;
	wire net2;
   	wire w_from_reg;
	reg reg1;
	assign net1 = 1'b1;
	assign net2 = net1;
	assign w_from_reg = reg1;
	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0, wire_reg_demo);
		reg1 = 1'b0;
		$display("=== Wire and Reg Demonstration ===");
		$display("Time=%0t : net1=%b, net2=%b, reg1=%b, w_from_reg=%b", $time, net1, net2, reg1, w_from_reg);
		#10 reg1 = 1'b1;
		$display("Time=%0t : net1=%b, net2=%b, reg1=%b, w_from_reg=%b", $time, net1, net2, reg1, w_from_reg);
		#10 $finish;
	end
	endmodule




