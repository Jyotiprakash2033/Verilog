`timescale 1ns/1ns
`include "gate_delays.v"

 module gate_delays_tb;

 reg A, B, C;
 wire OUT;
 D d1 (OUT, A, B, C);

 initial begin
 $dumpfile("gate_delays.vcd");
 $dumpvars(0,gate_delays_tb);
 A = 1'b0; B = 1'b0; C = 1'b0;
 #10 A = 1'b1; B = 1'b1; C = 1'b1;
 #10 A = 1'b1; B = 1'b0; C = 1'b0;
 #20 $finish;

 end

endmodule