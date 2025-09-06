module reg_display;
	reg [7:0] data;

	initial begin
		$dumpfile("reg_display.vcd");
  		$dumpvars(0, reg_display);

		data = 8'b10101010; 
		$display("Time=%0t : data (binary)  = %b", $time, data);
		$display("Time=%0t : data (hex)     = %h", $time, data);
		$display("Time=%0t : data (decimal) = %0d", $time, data);
				
		$finish;
		end
endmodule




