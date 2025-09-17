module encoder_func(
	input  [7:0] y,    
	output [2:0] a     
);

	function [2:0] encode;
		input [7:0] in;
		integer i;
		begin
        		encode = 3'b000;
         		for (i = 0; i < 8; i = i + 1) begin
            			if (in[i])
                  		encode = i[2:0];   
          		end
		end
	endfunction

	assign a = encode(y);

endmodule

