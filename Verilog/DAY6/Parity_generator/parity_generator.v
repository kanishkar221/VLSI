module parity_generator;
	reg  [7:0] data_in;
  	wire parity_bit;

	function automatic even_parity;
		input [7:0] data;
		integer i;
        begin
		even_parity = 0;
			for (i = 0; i < 8; i = i + 1)
				even_parity = even_parity ^ data[i];
		end
	endfunction

	assign parity_bit = even_parity(data_in);


	initial begin

		data_in = 8'b00000000; #5;
		$display("T=%0t | data_in=%b | parity_bit=%b", $time, data_in, parity_bit);

		data_in = 8'b11111111; #5;
		$display("T=%0t | data_in=%b | parity_bit=%b", $time, data_in, parity_bit);

		data_in = 8'b10101010; #5;
		$display("T=%0t | data_in=%b | parity_bit=%b", $time, data_in, parity_bit);

		data_in = 8'b11001100; #5;
		$display("T=%0t | data_in=%b | parity_bit=%b", $time, data_in, parity_bit);

		data_in = 8'b10000001; #5;
		$display("T=%0t | data_in=%b | parity_bit=%b", $time, data_in, parity_bit);

		$finish;
	end
endmodule

