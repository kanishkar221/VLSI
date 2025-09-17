module gate_task;
	reg [7:0] A, B;
	reg [7:0] AND_Out, OR_Out;

	task Gate_task;
		input  [7:0] in1, in2;
		output [7:0] and_out, or_out;
		begin
			and_out = in1 & in2;
			or_out  = in1 | in2;
		end
	endtask

	initial begin
		$monitor("Time=%0t | A=%b | B=%b | AND_Out=%b | OR_Out=%b", $time, A, B, AND_Out, OR_Out);

		A = 8'd74; B = 8'd34;  Gate_task(A, B, AND_Out, OR_Out);
		#10 A = 8'd54; B = 8'd12; Gate_task(A, B, AND_Out, OR_Out);
		#10 A = 8'd31; B = 8'd54; Gate_task(A, B, AND_Out, OR_Out);
		#10 A = 8'd75; B = 8'd44; Gate_task(A, B, AND_Out, OR_Out);
		#10 A = 8'd24; B = 8'd84; Gate_task(A, B, AND_Out, OR_Out);

		#100 $finish;
	end
endmodule

