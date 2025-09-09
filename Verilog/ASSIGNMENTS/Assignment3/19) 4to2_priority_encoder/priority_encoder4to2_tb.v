module priority_encoder4to2_tb;
  reg [3:0] d;
  wire [1:0] y;


  priority_encoder4to2 uut(d, y);

  initial begin
    $dumpfile("PriorityEncoder4to2.vcd");
    $dumpvars(0, priority_encoder4to2_tb);

    $display("TIME | D0 D1 D2 D3 | Y1 Y0");
    $monitor("%4t |  %b  %b  %b  %b |  %b  %b", $time, d[0], d[1], d[2], d[3], y[1], y[0]);

    d = 4'b0001; #10;
    d = 4'b0010; #10;
    d = 4'b0100; #10;
    d = 4'b1000; #10;
    d = 4'b0011; #10;
    d = 4'b0111; #10;
    d = 4'b1100; #10;

    $finish;
  end
endmodule

