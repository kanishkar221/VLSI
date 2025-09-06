`timescale 1ns/1ps

module net_types;
	reg a, b;
	wand wnet;
	wor onet;
        tri tnet;
        triand tandnet;

	assign #2 wnet = a;
	assign #3 wnet = b;

  	assign #2 onet = a;
 	assign #3 onet = b;

	assign #2 tnet = a;
 	assign #3 tnet = b;

  	assign #2 tandnet = a;
 	assign #3 tandnet = b;  

	initial begin
        $display("time | a b | wnet onet tnet tandnet");
        $monitor("%4t | %b %b |   %b     %b    %b      %b",
	$time, a, b, wnet, onet, tnet, tandnet);

	a = 0; b = 0;
	#5 a = 1;
        #5 b = 1;
	#5 a = 0;
        #5 b = 0;
        #5 $finish;
      end
endmodule




