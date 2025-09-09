module rep_module(
    input  wire       a,      
    input  wire [1:0] b,      
    input  wire [1:0] c,       
    output wire [5:0] y      
    );

assign y = { a, {4{ b[0] }}, c[1] };

endmodule

