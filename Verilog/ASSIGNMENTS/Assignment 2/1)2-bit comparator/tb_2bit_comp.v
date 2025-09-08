module tb_2bit_comp;
  reg [1:0] a, b;
  wire eq, lt, gt;

  comp_2bit uut(.a(a), .b(b), .eq(eq), .lt(lt), .gt(gt));

  initial begin
    $dumpfile("2bit_comp_wave.vcd");
    $dumpvars(0, tb_2bit_comp);
    $display("            2 bit comparator               ");
    $display("-------------------------------------------");
    $display("  A       B     |    A>B   A==B    A<B");
    $monitor(" %b %b     %b %b    |     %b     %b       %b",
             a[1], a[0], b[1], b[0], gt, eq, lt);


    a = 2'b00; b = 2'b00; #10;
    a = 2'b00; b = 2'b01; #10;
    a = 2'b00; b = 2'b10; #10;
    a = 2'b00; b = 2'b11; #10;
    a = 2'b01; b = 2'b00; #10;
    a = 2'b01; b = 2'b01; #10;
    a = 2'b01; b = 2'b10; #10;
    a = 2'b01; b = 2'b11; #10;
    a = 2'b10; b = 2'b00; #10;
    a = 2'b10; b = 2'b01; #10;
    a = 2'b10; b = 2'b10; #10;
    a = 2'b10; b = 2'b11; #10;
    a = 2'b11; b = 2'b00; #10;
    a = 2'b11; b = 2'b01; #10;
    a = 2'b11; b = 2'b10; #10;
    a = 2'b11; b = 2'b11; #10;

    $finish;
  end
endmodule

