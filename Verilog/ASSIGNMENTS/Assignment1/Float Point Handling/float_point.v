module float_point;
    real delta;
    integer i;

    initial begin
        delta = 4e10;
        $display("delta (real) = %e", delta);

        i = delta;
        $display("Assigned delta to integer i = %0d", i);

        delta = 2.18;
        $display("\ndelta (real) = %f", delta);

        i = delta;
        $display("Assigned delta to integer i = %0d", i);

        $finish;
    end
endmodule









