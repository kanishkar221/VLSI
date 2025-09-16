module sync_up_down_counter_tb;

    reg clk, reset, up_down;
    wire [3:0] count;

    sync_up_down_counter uut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    initial begin
        $dumpfile("sync_up_down_counter.vcd");
        $dumpvars(0, sync_up_down_counter_tb);

        $monitor("Time=%0t | reset=%b | up_down=%b | count=%b", $time, reset, up_down, count);

        reset = 1; up_down = 1;
        #10; reset = 0;

        up_down = 1; 
        #80;

   
        up_down = 0;
        #80;

        $finish;
    end

endmodule


