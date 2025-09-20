module reg_file(
	input wire clk,
	input wire we,
	input wire [2:0] addr,
	input wire [7:0] data_in,
	output reg [7:0] data_out  
);

	reg [7:0] mem [7:0];

	always @(posedge clk) begin
		if (we)
			mem[addr] <= data_in;
	end

	always @(*) begin
		data_out = mem[addr];
	end
endmodule

module reg_file_tb;
	reg clk;
	reg we;
	reg [2:0] addr;
	reg [7:0] data_in;
	wire [7:0] data_out;

	reg_file uut (.clk(clk), .we(we), .addr(addr), .data_in(data_in), .data_out(data_out));

	initial clk = 0;
		always #5 clk = ~clk;
	        integer i;

		initial begin
			$dumpfile("reg_file_tb.vcd");
			$dumpvars(0, reg_file_tb);

			$display("Time | we addr data_in | data_out");

			we = 1;
			for (i = 0; i < 8; i = i + 1) begin
				addr    = i;
				data_in = i * 8'h11;
				@(posedge clk);
				#1 $display("%0t | %b   %0d   %h | %h", $time, we, addr, data_in, data_out);
			end

			we = 0;
			for (i = 0; i < 8; i = i + 1) begin
				addr = i;
				@(posedge clk);
				#1 $display("%0t | %b   %0d   -- | %h", $time, we, addr, data_out);
			end

			$finish;
		end
endmodule

			
