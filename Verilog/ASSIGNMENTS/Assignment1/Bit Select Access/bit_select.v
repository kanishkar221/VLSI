module bit_select;
	reg [7:0] data;
	wire bit3;
	assign bit3 = data[3];
	initial begin
		data = 8'b10101100;
		$display("data (binary)  = %b", data);
		$display("data (binary)  = %b", data);
	        $display("data (hex)     = 0x%0h", data);
	        $display("data (decimal) = %0d", data);
       

		$finish;
  end
endmodule


















