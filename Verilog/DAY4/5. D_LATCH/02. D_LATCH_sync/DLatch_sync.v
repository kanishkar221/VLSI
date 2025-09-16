module DLatch_sync (
    input wire clk, d, en, reset,
    output reg q
);

always @(posedge clk) begin
    if (reset)
        q <= 1'b0;      
    else if (en)
        q <= d;         
    else
        q <= q;         
end

endmodule

