module demux1to4_tb;
  reg din, en;
  reg [1:0] sel;
  wire [3:0] y;

  demux1to4 uut(
    .din(din),
    .en(en),
    .sel(sel),
    .y(y)
  );

  initial begin
    $dumpfile("Demux1to4.vcd");
    $dumpvars(0, demux1to4_tb);
    
    $display("TIME | en din s1 s0 | y0 y1 y2 y3");
    $monitor("%4t |  %b  %b   %b  %b |  %b  %b  %b  %b", 
              $time, en, din, sel[1], sel[0], y[0], y[1], y[2], y[3]);

    en=0; din=1; sel=2'b00; #10;
    din=1; sel=2'b01; #10;
    din=1; sel=2'b10; #10;
    din=1; sel=2'b11; #10;

    en=1; din=0; sel=2'b00; #10;
    din=0; sel=2'b01; #10;
    din=0; sel=2'b10; #10;
    din=0; sel=2'b11; #10;

    din=1; sel=2'b00; #10;
    din=1; sel=2'b01; #10;
    din=1; sel=2'b10; #10;
    din=1; sel=2'b11; #10;

    $finish;
  end
endmodule

