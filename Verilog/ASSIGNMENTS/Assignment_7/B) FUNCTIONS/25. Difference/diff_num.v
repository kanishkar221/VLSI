module diff_num;

	reg [7:0] A, B;    
	reg [8:0] Diff;

	function [8:0] sub;
		input [7:0] x, y;
		begin
			sub = x - y;
		end
	endfunction

	initial begin
		$monitor("Time=%0t | A=%0d | B=%0d | Diff=%0d", $time, A, B, Diff);

		 A = 20; B = 10; Diff = sub(A, B); #10;
		 A = 15; B = 25; Diff = sub(A, B); #10;
		 A = 50; B = 5;  Diff = sub(A, B); #10;
		 A = 7;  B = 7;  Diff = sub(A, B); #10;

	#20 $finish;
	end

endmodule

