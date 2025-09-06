module tb_encoder;
	reg  [3:0] a;    
	wire [1:0] y;

	encoder uut (.a(a), .y(y));
	initial begin
		$dumpfile("encoder_wave.vcd");   
		$dumpvars(0, tb_encoder);
		$display(" a     | y ");
		$monitor(" %b | %b", a, y);

		a = 4'b0001; #10;   
		a = 4'b0010; #10;   
		a = 4'b0100; #10;   
		a = 4'b1000; #10;
		$finish;
	end
endmodule


