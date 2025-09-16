module tb_siso_async();

    reg clk;
    reg reset;
    reg serial_in;
    wire serial_out;

    siso_async uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    initial begin

        $dumpfile("siso_async.vcd");
        $dumpvars(0, tb_siso_async);

        $display("Time\t clk reset serial_in serial_out");
        $monitor("%0t\t %b  %b  %b  %b", $time, clk, reset, serial_in, serial_out);

        reset = 1; serial_in = 0; #7;   
        reset = 0; #3;                  
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
	reset = 1; #4; 
        reset = 0; #6;
        serial_in = 0; #10;
        serial_in = 1; #10;
        #30;
        $finish;
    end

endmodule

