module alu_task_func_tb;
	reg [7:0] a, b;
	reg [1:0] sel;
	wire [7:0] result;
	
	alu_task_func uut(.a(a), .b(b), .sel(sel), .result(result));
	
	task apply_stimulus;
		input [7:0] x, y;
		input [1:0] op;
		begin a = x; b = y; sel = op;#10;
			$display("T = %0t | a = %0d b = %0d sel = %b ==> result = %0d",$time, a, b, sel, result);
		end
	endtask

	initial begin
		apply_stimulus(8'd10, 8'd5, 2'b00);
		apply_stimulus(8'd20, 8'd8, 2'b01);
		apply_stimulus(8'd12, 8'd3, 2'b10);
		apply_stimulus(8'd12, 8'd3, 2'b11);
		#10 $finish;
	end
endmodule

