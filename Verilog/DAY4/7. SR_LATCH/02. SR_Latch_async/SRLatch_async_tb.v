module SRLatch_async_tb;

    reg s, r, en, reset;
    wire q;

    SRLatch_async uut(.s(s), .r(r), .en(en), .reset(reset), .q(q));

    initial begin
        s=0; r=0; en=0; reset=0;

        #5  reset=1;          
        #5  reset=0;
        #5  en=1; s=1; r=0;   
        #5  s=0; r=1;         
        #5  s=0; r=0;         
        #5  s=1; r=1;         
        #5  en=0; s=1; r=0;   
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0t | s=%b | r=%b | en=%b | reset=%b | q=%b", $time, s, r, en, reset, q);
    end

endmodule

