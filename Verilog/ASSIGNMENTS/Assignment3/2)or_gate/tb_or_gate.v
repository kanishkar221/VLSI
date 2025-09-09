module tb_or_gate;
        reg a, b;
        wire out;
        or_gate uut(.a(a), .b(b), .out(out));

        initial begin
        $display ("time\t a b | out");
        $monitor ("%0t\t %b %b | %b", $time, a, b, out);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule
          
