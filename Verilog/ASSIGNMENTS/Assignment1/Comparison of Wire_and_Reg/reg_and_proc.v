module reg_example;
	reg net1;
	reg net2;

	initial begin 
		net1 = 1'b1;
		net2 = net1;
		$display("Time\t net1 net2");
		$monitor("%0t\t %b    %b", $time, net1, net2);
        	#5;
      		net1 = 1'b0;
		#5;
		$finish;
	end
endmodule





