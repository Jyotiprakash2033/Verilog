`timescale 1ps/1ps
`include "clock_demo.v"

module clock_demo_tb();
wire clk;
my_clock mut(clk);

initial begin
   #100
$finish; 
end
 
 initial begin
    $dumpfile("clock_demo.vcd");
    $dumpvars(0,clock_demo_tb);
 end
endmodule