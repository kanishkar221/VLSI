module tb_decoder3to8_casez;
	reg [2:0] in;
  	wire [7:0] out;

	decoder3to8_casez uut (
      		.in(in),
   		.out(out)
	);

	initial begin
        
      		$monitor("Time=%0t | in=%b | out=%b", $time, in, out);
		in = 3'b000; #10;
    		in = 3'b001; #10;
      		in = 3'b010; #10;
      		in = 3'b011; #10;
      		in = 3'b100; #10;  
     		in = 3'b101; #10;  
     		in = 3'b110; #10;  
     		in = 3'b111; #10;  
		$finish;
 	end
	
	initial begin
		$dumpfile("decoder3to8_casez.vcd");
		$dumpvars(0, tb_decoder3to8_casez);
	end
endmodule

