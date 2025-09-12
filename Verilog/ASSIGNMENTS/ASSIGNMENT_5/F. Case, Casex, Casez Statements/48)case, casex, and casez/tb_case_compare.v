module tb_case_compare;
    reg [1:0] sel;
    wire y_case, y_casex, y_casez;

    case_example   u1 (.sel(sel), .y(y_case));
    casex_example  u2 (.sel(sel), .y(y_casex));
    casez_example  u3 (.sel(sel), .y(y_casez));

    initial begin
        $monitor("Time=%0t | sel=%b | case=%b | casex=%b | casez=%b",
                  $time, sel, y_case, y_casex, y_casez);

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        sel = 2'b0x; #10;
        sel = 2'b1x; #10;
        sel = 2'bz0; #10;
        sel = 2'bz1; #10;

        $finish;
    end


    initial begin
        $dumpfile("case_compare.vcd");
        $dumpvars(0, tb_case_compare);
    end
endmodule

