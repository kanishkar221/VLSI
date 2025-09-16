module sync_down_counter_tb;

    reg clk, reset;
    wire [3:0] count;

    sync_down_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    initial begin
        $dumpfile("sync_down_counter.vcd");
        $dumpvars(0, sync_down_counter_tb);

        $monitor("Time=%0t | reset=%b | count=%b", $time, reset, count);


        reset = 1; #10; 
        reset = 0; #150;

        $finish;
    end

endmodule

