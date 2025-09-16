module tb_pipo_async();

    reg clk, reset, load;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    pipo_async uut (
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
        $dumpfile("pipo_async.vcd");
        $dumpvars(0, tb_pipo_async);

        $display("Time\t clk reset load parallel_in parallel_out");
        $monitor("%0t\t %b  %b  %b  %b  %b", $time, clk, reset, load, parallel_in, parallel_out);

        reset = 1; load = 0; parallel_in = 4'b0000; #7;  
        reset = 0; #3;
        load = 1; parallel_in = 4'b1010; #10;
        load = 0; #20;
        reset = 1; #4;  
        reset = 0; #6;
        load = 1; parallel_in = 4'b1101; #10;
        load = 0; #20;

        $finish;
    end

endmodule

