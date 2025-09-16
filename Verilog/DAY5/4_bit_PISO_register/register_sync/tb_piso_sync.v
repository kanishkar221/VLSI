module tb_piso_sync();

    reg clk, reset, load;
    reg [3:0] parallel_in;
    wire serial_out;

    piso_sync uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end


    initial begin
        $dumpfile("piso_sync.vcd");
        $dumpvars(0, tb_piso_sync);

        $display("Time\t clk reset load parallel_in serial_out");
        $monitor("%0t\t %b  %b  %b  %b  %b", $time, clk, reset, load, parallel_in, serial_out);

        reset = 1; load = 0; parallel_in = 4'b0000; #10;
        reset = 0;

        load = 1; parallel_in = 4'b1011; #10;
        load = 0;
     
	#40;

        load = 1; parallel_in = 4'b1100; #10;
        load = 0;

        #40;
        $finish;
    end

endmodule

