module parametric_comparator_tb;
  reg  [3:0] a,b;
  wire eq,gt,lt;

  parametric_comparator #(4) uut(.a(a), .b(b), .eq(eq), .gt(gt), .lt(lt));

  initial begin
    $dumpfile("parametric_comparator.vcd");
    $dumpvars(0, parametric_comparator_tb);
    $monitor("Time=%0t | a=%b b=%b | eq=%b gt=%b lt=%b",
              $time, a, b, eq, gt, lt);

    a=4'b0101; b=4'b0101; #10; 
    a=4'b1010; b=4'b0111; #10; 
    a=4'b0011; b=4'b1000; #10; 
    a=4'b1111; b=4'b0000; #10; 
    $finish;
  end
endmodule

