module async_ring_counter (
    input clk,         
    input reset,       
    output [3:0] q
);

    reg [3:0] q_reg;

    assign q = q_reg;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q_reg <= 4'b1000;           
        else begin
            q_reg[3] <= q_reg[0];        
            q_reg[2] <= q_reg[3];
            q_reg[1] <= q_reg[2];
            q_reg[0] <= q_reg[1];
        end
    end

endmodule

