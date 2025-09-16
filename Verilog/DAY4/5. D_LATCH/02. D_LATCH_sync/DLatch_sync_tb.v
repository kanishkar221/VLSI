module DLatch_sync_tb;

    reg clk, d, en, reset;
    wire q;

    DLatch_sync uut(.clk(clk), .d(d), .en(en), .reset(reset), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;   

    initial begin
        d=0; en=0; reset=0;

        #2 reset = 1;      
        #8 reset = 0;      
        #10 en=1; d=1;     
        #10 d=0;           
        #10 en=0; d=1;     
        #10 en=1; d=1;     
        #10 reset=1;       
        #10 reset=0;
        #30 $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b | d=%b | en=%b | reset=%b | q=%b",$time, clk, d, en, reset, q);
    end

endmodule

