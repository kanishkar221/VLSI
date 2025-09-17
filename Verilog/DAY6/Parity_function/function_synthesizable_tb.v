module function_synthesizable_tb;
	reg  [7:0] data_in;
   	wire parity_bit;

	function_synthesizable uut (
		.data_in(data_in),
      		.parity_bit(parity_bit)
	);
	
	initial begin
		
		data_in = 8'b10101010; #10;
		$display ("Input:%b, Parity Bit:%b", data_in, parity_bit);
		data_in = 8'b11110000; #10;
		$display ("Input:%b, Parity Bit:%b", data_in, parity_bit);
		data_in = 8'b00001111; #10;
		$display ("Input:%b, Parity Bit:%b", data_in, parity_bit);
		
		$stop;
	end
endmodule


