module tb_bus_decoder;
    reg [1:0] addr;
    wire [3:0] enable;

    bus_decoder uut (
        .addr(addr),
        .enable(enable)
    );

    initial begin
        $monitor("Time=%0t | addr=%b | enable=%b", $time, addr, enable);

        addr = 2'b00; #10;
        addr = 2'b01; #10;
        addr = 2'b10; #10;
        addr = 2'b11; #10;


        addr = 2'bxx; #10;  

        $finish;
    end

    initial begin
        $dumpfile("bus_decoder.vcd");
        $dumpvars(0, tb_bus_decoder);
    end
endmodule

