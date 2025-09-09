`timescale 1ns/1ps

module tb_div_mod;

	reg a, b;
	reg signed sa, sb;
	wire div_out, mod_out;
	wire signed sdiv_out, smod_out;
	div_mod uut (
		 .a(a),
		 .b(b),
		 .sa(sa),
		 .sb(sb),
		 .div_out(div_out),
		 .mod_out(mod_out),
		 .sdiv_out(sdiv_out),
		 .smod_out(smod_out)
	);

	initial begin
		
		$dumpfile("div_mod_wave.vcd");
		$dumpvars(0, tb_div_mod);
		$display("Time\t a b | div mod | sa sb | sdiv smod");
		    a = 8'd10; b = 8'd3; sa = 8'sd10; sb = 8'sd3;
		    #10 $display("%0dns\t %0d %0d | %0d %0d | %0d %0d | %0d %0d", $time, a, b, div_out, mod_out, sa, sb, sdiv_out, smod_out);

		    a = 8'd15; b = 8'd4; sa = -8'sd15; sb = 8'sd4;
		    #10 $display("%0dns\t %0d %0d | %0d %0d | %0d %0d | %0d %0d", $time, a, b, div_out, mod_out, sa, sb, sdiv_out, smod_out);

		    a = 8'd20; b = 8'd5; sa = 8'sd20; sb = -8'sd6;
		    #10 $display("%0dns\t %0d %0d | %0d %0d | %0d %0d | %0d %0d", $time, a, b, div_out, mod_out, sa, sb, sdiv_out, smod_out);

		    a = 8'd7; b = 8'd8; sa = -8'sd7; sb = -8'sd3;
		    #10 $display("%0dns\t %0d %0d | %0d %0d | %0d %0d | %0d %0d", $time, a, b, div_out, mod_out, sa, sb, sdiv_out, smod_out);

		    $finish;
	    end

	    endmodule



