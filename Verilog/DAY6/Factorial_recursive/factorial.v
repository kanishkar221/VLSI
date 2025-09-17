module factorial (
	input  [7:0] n,
	output [15:0] result
);

	assign result = fact(n);
	function automatic [15:0] fact(input [7:0] N);
        begin
            if (N <= 1)
                fact = 1;
            else
                fact = N * fact(N-1);
        end
    endfunction
endmodule

