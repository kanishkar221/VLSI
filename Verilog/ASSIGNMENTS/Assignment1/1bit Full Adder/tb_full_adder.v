module tb_full_adder;
	reg a, b, cin;
	wire sum, cout;
	full_adder uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
	initial begin
        $display("A B Cin | Sum Cout");
	$monitor("%4t | %b %b %b | %b %b ", $time, a, b, cin, sum, cout);

	#10 a=0; b=0; cin=0;
	#10 a=0; b=0; cin=1;
	#10 a=0; b=1; cin=0;
	#10 a=0; b=1; cin=1;
	#10 a=1; b=0; cin=0;
	#10 a=1; b=0; cin=1;
	#10 a=1; b=1; cin=0;
	#10 a=1; b=1; cin=1;
	$finish;
	end
endmodule

