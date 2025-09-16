module tb_sipo_async();

    reg clk;
    reg reset;
    reg serial_in;
    wire [3:0] parallel_out;

    sipo_async uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    initial begin
        $dumpfile("sipo_async.vcd");
        $dumpvars(0, tb_sipo_async);

        $display("Time\t clk reset serial_in parallel_out");
        $monitor("%0t\t %b  %b  %b  %b", $time, clk, reset, serial_in, parallel_out);

        reset = 1; serial_in = 0; #7;   
        reset = 0; #3;                  

        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        reset = 1; #4;  
        reset = 0; #6;

        serial_in = 1; #10;
        serial_in = 0; #10;

        #20;
        $finish;
    end

endmodule

