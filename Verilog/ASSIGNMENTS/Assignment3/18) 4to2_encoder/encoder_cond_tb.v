module encoder_cond_tb;
  reg [3:0] d;
  wire [1:0] y;

  encoder_cond uut(d, y);

  initial begin
    $dumpfile("encoder_wave.vcd");   // waveform dump file
    $dumpvars(0, encoder_cond_tb);   // dump all variables
    $display("TIME | D0 D1 D2 D3 | Y1 Y0");
    $monitor("%4t |  %b  %b  %b  %b |  %b  %b", $time, d[0], d[1], d[2], d[3], y[1], y[0]);

    d = 4'b0001; #10;   // Input D0
    d = 4'b0010; #10;   // Input D1
    d = 4'b0100; #10;   // Input D2
    d = 4'b1000; #10;   // Input D3
    $finish;
  end
endmodule

