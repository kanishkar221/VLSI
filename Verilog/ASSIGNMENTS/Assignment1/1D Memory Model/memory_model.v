module memory_model1;
    reg [7:0] mem [0:7];
        integer i;

	initial begin
        mem[0] = 8'hA;
        mem[1] = 8'hB;
        mem[2] = 8'b10110110;
        mem[3] = 8'd22;
        for(i = 0; i < 8; i = i + 1) begin
        $display("mem[%d] = %h (Hex), mem[%d] = %b (Bin), mem[%d] = %d (Dec)", i, mem[i], i, mem[i], i, mem[i]);
        end
        $finish;
	end
	endmodule




