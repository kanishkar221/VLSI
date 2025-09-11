module tb_ALU;
    reg [3:0]a,b;
    reg [2:0]Sel;
    wire [3:0]Out;
    wire carry;

    
    ALU uut(.a(a), .b(a), .Sel(Sel), .Out(Out), .carry(carry));

    initial begin
        $dumpfile("ALU_wave.vcd");   
        $dumpvars(0, tb_ALU);

        $monitor("Time=%t | Sel=%b | a=%b | b=%b | Out=%b | Carry=%b", $time, Sel, a, b, Out, carry);

      
        a = 4'b1010; 
        b = 4'b1111; 

        Sel = 3'b000; #10;  
        Sel = 3'b001; #10;  
        Sel = 3'b010; #10;  
        Sel = 3'b011; #10;  
        Sel = 3'b100; #10;  
        Sel = 3'b101; #10;  
        Sel = 3'b110; #10;  
        Sel = 3'b111; #10;  

        $finish;
    end
endmodule

