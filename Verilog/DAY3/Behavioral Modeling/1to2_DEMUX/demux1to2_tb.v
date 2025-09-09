module demux1to2_tb;
	reg din, sel;
	wire y0, y1;

	demux1to2_beh uut (
		 .din(din),
		 .sel(sel),
		 .y0(y0),
		 .y1(y1)
	);

	initial begin
		$dumpfile("demux1to2.vcd");
		$dumpvars(0, demux1to2_tb);
		$monitor("Time=%0t | din=%b sel=%b | y0=%b y1=%b",$time, din, sel, y0, y1);
		
		din=0; sel=0; #10;  
		din=1; sel=0; #10;  
		din=0; sel=1; #10;  
		din=1; sel=1; #10;
		$finish;
	end
endmodule

