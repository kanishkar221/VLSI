module alu_task_func(
	input [7:0] a, b,
	input [1:0] sel,
	output reg [7:0] result
);
	function [7:0] add_func;
	input [7:0] x, y;
	begin
		add_func = x + y;
	end
	endfunction

	task alu_task;
		input [7:0] x, y;
		input [1:0] op;
		output [7:0] r;
		begin
			case(op)
				2'b01:r = x - y;
				2'b10:r = x & y;
				2'b11:r = x | y;
				default:r = 8'h00;
			endcase
		end
	endtask
	
	always@(*)begin 
		case(sel)
			2'b00: result = add_func(a, b);
			default: alu_task(a, b, sel, result);
		endcase
	end
endmodule


