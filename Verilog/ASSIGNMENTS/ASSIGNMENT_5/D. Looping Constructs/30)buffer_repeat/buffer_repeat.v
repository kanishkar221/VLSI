module buffer_repeat;
	reg clk;
	reg [7:0] data_in;         
	reg [7:0] buffer [0:7];    
	integer i;
	initial begin
		clk = 0;
		forever #5 clk = ~clk;   // 10 time units period
	end
	initial begin
		i = 0;
		data_in = 8'h01; 
		$display("Starting buffer write...");
		repeat (8) begin
			@(posedge clk);        
			buffer[i] = data_in;   
			$display("Time=%0t | buffer[%0d] = %0h", $time, i, buffer[i]);
			data_in = data_in + 1; 
			i = i + 1;
		end

	#10 $finish;
	end
endmodule

