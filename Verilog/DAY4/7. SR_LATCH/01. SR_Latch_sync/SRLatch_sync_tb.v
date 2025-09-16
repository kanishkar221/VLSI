module SRLatch_sync_tb;

    reg clk, s, r, en, reset;
    wire q;

    SRLatch_sync uut(.clk(clk), .s(s), .r(r), .en(en), .reset(reset), .q(q));

    initial clk=0;
    always #5 clk = ~clk;   

    initial begin
        s=0; r=0; en=0; reset=0;

        #2  reset=1;        
        #10 reset=0;
        #10 en=1; s=1; r=0; 
        #10 s=0; r=1;       
        #10 s=0; r=0;       
        #10 s=1; r=1;       
        #10 en=0; s=1; r=0; 
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b | s=%b | r=%b | en=%b | reset=%b | q=%b", $time, clk, s, r, en, reset, q);
    end

endmodule

