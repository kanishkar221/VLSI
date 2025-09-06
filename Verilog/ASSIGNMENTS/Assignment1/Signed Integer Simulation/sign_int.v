module sign_int;
	integer i;
	initial begin
	$monitor("time=%0t : i(binary)=%b : i(decimal)=%d",$time,i[7:0],i);
	i=34;#10;
	i=67;#10;
	i=91;#10;
	$finish;
	end
endmodule


