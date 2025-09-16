module tb_sipo_sync();

    reg clk;
    reg reset;
    reg serial_in;
    wire [3:0] parallel_out;

    sipo_sync uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        $dumpfile("sipo_sync.vcd");
        $dumpvars(0, tb_sipo_sync);

        $display("Time\t clk reset serial_in parallel_out");
        $monitor("%0t\t %b  %b  %b  %b", $time, clk, reset, serial_in, parallel_out);

        reset = 1; serial_in = 0; #10;  
        reset = 0;

        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        #20;
        $finish;
    end

endmodule

