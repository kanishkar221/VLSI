module ring_counter_tb;

    reg clk, reset;
    wire [3:0] q;

    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("ring_counter.vcd");
        $dumpvars(0, ring_counter_tb);

        $monitor("Time=%0t | reset=%b | q=%b", $time, reset, q);


        reset = 1; #10;
        reset = 0; #100;

        $finish;
    end

endmodule

