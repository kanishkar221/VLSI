module bitwise_and;

	reg [7:0] data;
	reg result;

	function and_all;
		input [7:0] x;
      		integer i;
    		begin
          		and_all = 1'b1;  
          		for (i = 0; i < 8; i = i + 1) begin
            			and_all = and_all & x[i];
          		end
		end
	endfunction

	initial begin
		$monitor("Time=%0t | data=%b | result=%b", $time, data, result);

      		data = 8'b11111111; result = and_all(data); #10;  
      		data = 8'b10111111; result = and_all(data); #10;  
      		data = 8'b00000000; result = and_all(data); #10;  
     		data = 8'b11110000; result = and_all(data); #10;  
      		data = 8'b11111110; result = and_all(data); #10;  

		#20 $finish;
	end
endmodule

