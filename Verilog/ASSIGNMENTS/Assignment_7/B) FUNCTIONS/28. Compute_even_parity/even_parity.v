module even_parity;

	reg [7:0] data;
	reg parity;

	function parity_even;
		input [7:0] x;
		integer i;
  		reg p;
		begin
      			p = 0;  
       			for (i = 0; i < 8; i = i + 1)
          			p = p ^ x[i];  

			parity_even = ~p;  
		end
 	endfunction

	initial begin
		$monitor("Time=%0t | data=%b | parity=%b", $time, data, parity);

		data = 8'b00000000; parity = parity_even(data); #10;  
		data = 8'b00000001; parity = parity_even(data); #10;  
      		data = 8'b10101010; parity = parity_even(data); #10;  
      		data = 8'b11110000; parity = parity_even(data); #10;  
      		data = 8'b11111111; parity = parity_even(data); #10;  

		#20 $finish;
	end
endmodule

