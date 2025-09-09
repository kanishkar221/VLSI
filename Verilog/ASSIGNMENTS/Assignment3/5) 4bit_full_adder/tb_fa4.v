`timescale 1ns/1ps

module tb_fa4;
	reg  a, b;
	reg  c_in;
	wire sum;
	wire c_out;

	fa4 uut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .sum(sum),
        .c_out(c_out)
    );

    initial begin
        $dumpfile("fa4.vcd");
        $dumpvars(0, tb_fa4);

        $display("time(ns)\ta    b    cin | sum  cout");
	$monitor("%0t\t%b %b %b | %b %b", $time, a, b, c_in, sum, c_out);
	a = 4'd0;  b = 4'd0;  c_in = 1'b0;  #10; 
        a = 4'd3;  b = 4'd2;  c_in = 1'b0;  #10; 
        a = 4'd7;  b = 4'd8;  c_in = 1'b0;  #10; 
        a = 4'd15; b = 4'd1;  c_in = 1'b0;  #10; 
        a = 4'd15; b = 4'd15; c_in = 1'b1;  #10; 
        a = 4'd8;  b = 4'd8;  c_in = 1'b1;  #10; 
	#5;
	$finish;
	end
endmodule


	
