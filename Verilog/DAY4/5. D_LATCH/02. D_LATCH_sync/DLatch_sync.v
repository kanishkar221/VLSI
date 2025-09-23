module DLatch (
    input wire d, en, reset,
    output reg q
);

always @(*) begin
    if (reset)
        q = 1'b0;
    else if (en)
        q = d;
end

endmodule

