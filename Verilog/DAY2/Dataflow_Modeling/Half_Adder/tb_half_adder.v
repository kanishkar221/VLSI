module tb_half_adder;

	reg a, b;
	wire sum, carry;
	half_adder ha1 (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $display("A B | SUM CARRY");
 	$display("---------------");
	a = 0; b = 0; #10 $display("%b %b |  %b    %b", a, b, sum, carry);
	a = 0; b = 1; #10 $display("%b %b |  %b    %b", a, b, sum, carry);
	a = 1; b = 0; #10 $display("%b %b |  %b    %b", a, b, sum, carry);
	a = 1; b = 1; #10 $display("%b %b |  %b    %b", a, b, sum, carry);
     	$finish;
	end
endmodule


