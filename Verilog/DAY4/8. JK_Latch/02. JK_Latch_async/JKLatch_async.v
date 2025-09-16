module JKLatch_async (
    input wire J, K,
    input wire en, reset,
    output reg q
);

always @(*) begin
    if (reset)
        q = 1'b0;
    else if (en) begin
        case ({J, K})
            2'b00: q = q;       
            2'b01: q = 1'b0;    
            2'b10: q = 1'b1;    
            2'b11: q = ~q;      
        endcase
    end
end

endmodule

