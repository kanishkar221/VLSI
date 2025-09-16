module JKLatch_sync_tb;

    reg clk, J, K, en, reset;
    wire q;

   JKLatch_sync  uut (.clk(clk), .J(J), .K(K), .en(en), .reset(reset), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;  

    initial begin
     	J=0; K=0; en=0; reset=0;

        #2 reset=1;   
        #8 reset=0;   
        #10 en=1; J=1; K=0;  
        #10 J=0; K=1;        
        #10 J=1; K=1;        
        #10 J=0; K=0;        
        #10 en=0;            
        #10 reset=1;         
        #10 reset=0;
        #40 $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b | J=%b K=%b | en=%b | reset=%b | q=%b", $time, clk, J, K, en, reset, q);
    end

endmodule

