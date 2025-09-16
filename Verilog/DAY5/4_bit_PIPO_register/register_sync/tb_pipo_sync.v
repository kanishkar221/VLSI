module tb_pipo_sync();

    reg clk, reset, load;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    pipo_sync uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );

	
	initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        $dumpfile("pipo_sync.vcd");
        $dumpvars(0, tb_pipo_sync);

        $display("Time\t clk reset load parallel_in parallel_out");
        $monitor("%0t\t %b  %b  %b  %b  %b", $time, clk, reset, load, parallel_in, parallel_out);

        reset = 1; load = 0; parallel_in = 4'b0000; #10;  
        reset = 0;
	load = 1; parallel_in = 4'b1011; #10;
        load = 0; #20;
        load = 1; parallel_in = 4'b1100; #10;
        load = 0; #20;

        $finish;
    end

endmodule

