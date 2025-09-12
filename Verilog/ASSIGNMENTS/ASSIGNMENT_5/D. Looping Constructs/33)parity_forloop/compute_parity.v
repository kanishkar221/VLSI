module compute_parity;
	reg [7:0] data;    
	reg parity;        
	integer i;
	initial begin
		data = 8'b1010_1101;   
		parity = 0;

		$display("Input data = %b", data);
		for (i = 0; i < 8; i = i + 1) begin
			parity = parity ^ data[i];
		end

		$display("Parity = %b (1=odd, 0=even)", parity);
		#10 $finish;
	end
endmodule

