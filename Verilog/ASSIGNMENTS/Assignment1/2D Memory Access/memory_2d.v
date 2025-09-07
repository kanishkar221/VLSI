module memory_2d;
	reg [7:0] mem [3:0][3:0];
	integer i, j;
	initial begin
		for (i = 0; i < 4; i = i + 1) begin
			for (j = 0; j < 4; j = j + 1) begin
				mem[i][j] = (i * 10) + j;
			end
		end
		$display("2D Memory Contents:");
		for (i = 0; i < 4; i = i + 1) begin
			for (j = 0; j < 4; j = j + 1) begin
				$write("%0d ", mem[i][j]);
			end
			$write("\n");
		end
		$display("\nSpecific values:");
		$display("mem[3][2] = %0d", mem[3][2]);
		$display("mem[1][1] = %0d", mem[1][1]);
		$display("mem[0][3] = %0d", mem[0][3]);
		$finish;
	end
endmodule





	

