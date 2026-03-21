`timescale 1ps/1ps
`include "../../Clock/clock_demo.v"
`include "3bitCounter.v"
`include "../../Reset/reset.v"

module CounterUp3_tb();

wire [2:0]q;
reg t ; 
wire clk,reset;
initial t =1;
my_reset rut(reset);
my_clock cut(clk);
up_counter mut(.t(t),.q(q),.reset(reset),.clk(clk));
initial begin

$display("3 bit ripple postive asynchronous up counter demostration :");
$monitor("$time: %0t | clk : %0b | reset : %0b | t: %0b |  q2: %0b |q1: %0b | q0: %0b",$time,clk, reset,t,q[2],q[1],q[0]);
#100
$finish;
end
initial begin
    $dumpfile("3bitCounter.vcd");
    $dumpvars(0,CounterUp3_tb);
end
endmodule