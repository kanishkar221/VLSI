module part_select;
	reg  [7:0] bus; 
	wire [3:0] lower_nibble;

	assign lower_nibble = bus[3:0];

    	initial begin
		bus = 8'b1010_1100;
		$display("bus = %b (0x%0h)", bus, bus);
		$display("lower_nibble = %b (0x%0h)", lower_nibble, lower_nibble);
		$finish;
    end
endmodule




















































