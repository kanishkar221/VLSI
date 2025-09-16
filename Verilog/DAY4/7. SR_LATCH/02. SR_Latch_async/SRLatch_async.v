module SRLatch_async (
    input wire s, r,   
    input wire en,     
    input wire reset,  
    output reg q
);

always @(*) begin
    if (reset)
        q = 1'b0;      
    else if (en) begin
        case ({s,r})
            2'b00: q = q;      
            2'b10: q = 1'b1;   
            2'b01: q = 1'b0;   
            2'b11: q = 1'b0;   
        endcase
    end
end

endmodule

