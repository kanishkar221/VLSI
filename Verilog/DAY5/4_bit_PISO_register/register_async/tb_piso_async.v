module tb_piso_async();

    reg clk, reset, load;
    reg [3:0] parallel_in;
    wire serial_out;

    piso_async uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("piso_async.vcd");
        $dumpvars(0, tb_piso_async);

        $display("Time\t clk reset load parallel_in serial_out");
        $monitor("%0t\t %b  %b  %b  %b  %b", $time, clk, reset, load, parallel_in, serial_out);

        reset = 1; load = 0; parallel_in = 4'b0000; #7;   
        reset = 0; #3;
        load = 1; parallel_in = 4'b1010; #10;
        load = 0;
	#30;
        reset = 1; #4;
        reset = 0; #6;
	load = 1; parallel_in = 4'b1101; #10;
        load = 0;

        #40;
        $finish;
    end

endmodule

