module min_num;

	reg [7:0] A, B;
	reg [7:0] Min;

	function [7:0] minimum;
		input [7:0] x, y;
		begin
       			if (x < y)
        			minimum = x;
        		else
             			minimum = y;
      		end
	endfunction

	initial begin
		$monitor("Time=%0t | A=%0d | B=%0d | Min=%0d", $time, A, B, Min);

		A = 10; B = 20; Min = minimum(A, B); #10;
		A = 50; B = 25; Min = minimum(A, B); #10;
     		A = 100; B = 200; Min = minimum(A, B); #10;
      		A = 8;  B = 8;   Min = minimum(A, B); #10;
    		A = 255; B = 1;  Min = minimum(A, B); #10;

  		#20 $finish;
	end
endmodule

