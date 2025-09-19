module gray_code;

	reg [3:0] bin;
	reg [3:0] gray;

	function [3:0] bin_to_gray;
		input [3:0] b;
		begin
			bin_to_gray = b ^ (b >> 1);
		end
	endfunction

	initial begin
		$monitor("Time=%0t | Binary=%b (%0d) | Gray=%b", $time, bin, bin, gray);

		bin = 4'b0000; gray = bin_to_gray(bin); #10;
     		bin = 4'b0001; gray = bin_to_gray(bin); #10;
      		bin = 4'b0010; gray = bin_to_gray(bin); #10;
     		bin = 4'b0011; gray = bin_to_gray(bin); #10;
      		bin = 4'b0100; gray = bin_to_gray(bin); #10;
      		bin = 4'b1010; gray = bin_to_gray(bin); #10;
      		bin = 4'b1111; gray = bin_to_gray(bin); #10;

      		#20 $finish;
   	end
endmodule

