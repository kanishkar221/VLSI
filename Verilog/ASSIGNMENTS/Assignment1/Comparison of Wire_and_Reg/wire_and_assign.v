module wire_and_assign;
	wire net1;
	wire net2;

	assign net1 = 1'b1;
	assign net2 = net1;

	initial begin
		$display("Time\t net1 net2");
      		$monitor("%0t\t %b    %b", $time, net1, net2);
       		#10;
		$finish;
	end
endmodule





