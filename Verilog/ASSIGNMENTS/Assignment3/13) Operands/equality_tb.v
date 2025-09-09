module equality_tb;
	reg [3:0] a, b;
	wire y_case, y_logic;
	equality uut (
		.a(a),
		.b(b),
		.y_case(y_case),
		.y_logic(y_logic)
	);
	initial begin
		$monitor("Time=%0t | A=%b | B=%b | y_case=%b | y_logic=%b", $time, a, b, y_case, y_logic);

		a = 4'b0011; b = 4'b0011; #10;   
		a = 4'b0011; b = 4'bx011; #10;   
		a = 4'bx011; b = 4'bx011; #10;   
		a = 4'b1z11; b = 4'b1z11; #10;   
		a = 4'bz011; b = 4'b1z11; #10;   
		a = 4'bx011; b = 4'b1x11; #10;  
		a = 4'b1011; b = 4'b1010; #10;  

		$finish;
		end
endmodule


