module JKFF_sync_tb;

    reg clk, rst_sync, set_sync, j, k;
    wire q;

    JKFF_sync uut(.clk(clk), .rst_sync(rst_sync), .set_sync(set_sync), .j(j), .k(k), .q(q));


    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst_sync = 0; set_sync = 0; j = 0; k = 0;

        #5  j = 1; k = 0;      
        #10 rst_sync = 1;      
        #10 rst_sync = 0;
        #10 set_sync = 1;      
        #10 set_sync = 0;
        #10 j = 0; k = 1;      
        #10 j = 1; k = 1;      
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b | rst_sync=%b | set_sync=%b | j=%b | k=%b | q=%b", $time, clk, rst_sync, set_sync, j, k, q);
    end
endmodule

