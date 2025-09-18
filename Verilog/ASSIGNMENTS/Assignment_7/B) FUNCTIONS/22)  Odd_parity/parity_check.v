module parity_check;

	reg  [7:0] A;    
	reg        P;

	function parity(input [7:0] x);
		integer i;
		begin
			parity = 0;                
			for (i = 0; i < 8; i = i + 1) begin
				parity = parity ^ x[i]; 
			end
		end
	endfunction

	initial begin
		$monitor("Time=%0t | A=%b | Parity=%b", $time, A, P);

		A = 8'b00000000; P = parity(A); #10; 
      		A = 8'b00000001; P = parity(A); #10; 
      		A = 8'b10101010; P = parity(A); #10; 
      		A = 8'b11110000; P = parity(A); #10; 
      		A = 8'b11110001; P = parity(A); #10; 
     		A = 8'b11111111; P = parity(A); #10; 
		#50;
		$finish;
	end

endmodule

