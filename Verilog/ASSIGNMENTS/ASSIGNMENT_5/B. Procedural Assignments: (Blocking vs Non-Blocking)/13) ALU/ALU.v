module ALU(a,b,Sel,Out,carry);
    input [3:0]a,b;
    input [2:0]Sel;
    output reg [3:0]Out;
    output reg carry;

    always @ (*) begin
        case(Sel)
            3'b000: {carry,Out} = a + b;  // Addition
            3'b001: {carry,Out} = a - b;  // Subtraction
            3'b010: Out = a / b;          // Division
            3'b011: Out = a % b;          // Modulus
            3'b100: Out = a | b;          // OR
            3'b101: Out = a & b;          // AND
            3'b110: Out = a ^ b;          // XOR
            3'b111: Out = ~a;             // NOT
            default: Out = 4'bxxxx;
        endcase
    end
endmodule

