module bus_decoder (
    input  [1:0] addr,     
    output reg [3:0] enable 
);

    always @(*) begin
        case (addr)
            2'b00: enable = 4'b0001; 
            2'b01: enable = 4'b0010; 
            2'b10: enable = 4'b0100; 
            2'b11: enable = 4'b1000; 
            default: enable = 4'b0000;
        endcase
    end
endmodule

