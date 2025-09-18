module signed_add;
	reg  signed [7:0] a, b;     
	reg  signed [8:0] sum;      

	task add_task;
		input  signed [7:0] x, y;
		output signed [8:0] s;
		begin
			s = x + y;
		end
	endtask

	initial begin
		$monitor("Time=%0t | a=%d | b=%d | sum=%d", $time, a, b, sum);

    		a =  8'sd50;  b =  8'sd20;   add_task(a, b, sum); #5;  
		a = -8'sd30;  b =  8'sd10;   add_task(a, b, sum); #5;  
		a = -8'sd40;  b = -8'sd50;   add_task(a, b, sum); #5;  
		a =  8'sd100; b = -8'sd20;   add_task(a, b, sum); #5;  

        #20 $finish;
    end
endmodule

