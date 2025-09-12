module byte16_memory;
	reg [7:0] mem [0:15]; 
	integer i;

	initial begin
	i = 0;
	$display("Initializing 16_byte memory");
	
	repeat (16) begin
		mem[i] = i;
		$display("mem[%0d] = %0d", i, mem[i]);
		i = i + 1;
	end

	#10 $finish; 
	end
endmodule

