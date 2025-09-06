`timescale 1ns/1ps
module real_float;
realtime current_time;
initial begin
$monitor("Time=%0t  : current_time=%.3f",$time,current_time);
current_time=$realtime;#10;
current_time=$realtime;#20;
current_time=$realtime;#30;
$finish;
end
endmodule

