module case_example (
    input  [1:0] sel,
    output reg y
);
    always @(*) begin
        case (sel)  
            2'b00: y = 1'b0;
            2'b01: y = 1'b1;
            2'b10: y = 1'b0;
            2'b11: y = 1'b1;
            default: y = 1'bx;
        endcase
    end
endmodule

module casex_example (
    input  [1:0] sel,
    output reg y
);
    always @(*) begin
        casex (sel) 
            2'b0x: y = 1'b0;  
            2'b1x: y = 1'b1;  
            default: y = 1'bx;
        endcase
    end
endmodule



module casez_example (
    input  [1:0] sel,
    output reg y
);
    always @(*) begin
        casez (sel) 
            2'b0z: y = 1'b0;  
            2'b1z: y = 1'b1;  
            default: y = 1'bx;
        endcase
    end
endmodule

