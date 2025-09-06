module tb_decoder;
	reg  [1:0] a;   
	wire [3:0] y;

	decoder uut (.a(a), .y(y));
	initial begin
		$dumpfile("decoder_wave.vcd");   // for GTKWave
		$dumpvars(0, tb_decoder);

		$display(" a  |   y");
		$monitor(" %b | %b", a, y);
		a = 2'b00; #10;   
		a = 2'b01; #10;   
		a = 2'b10; #10;   
		a = 2'b11; #10;
		$finish;
	end
endmodule



