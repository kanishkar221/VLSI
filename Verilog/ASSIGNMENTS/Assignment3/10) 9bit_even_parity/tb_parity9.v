module tb_parity9;
	reg [8:0] x;
	wire ep, op;

	parity9 uut (
	       .x(x),
	       .ep(ep),
	       .op(op)
	);

	initial begin
	$dumpfile("parity.vcd");
        $dumpvars(0, tb_parity9);
	$display("time\t\tx\t\t ep op");
	$monitor("%0t\t%b\t %b  %b", $time, x, ep, op);

	x = 9'b000000000; #10;  
	x = 9'b000000001; #10;  
        x = 9'b000000011; #10;  
        x = 9'b101010101; #10;  
        x = 9'b010011001; #10;  
        x = 9'b111111111; #10;  
	$finish;
end
endmodule

