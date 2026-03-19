`timescale 1ps/1ps
`include "d_flipflop.v"
`include "../../Clock/clock_demo.v"


module d_flipflop_tb();

wire q;
wire qbar;
reg d;
wire clk;

my_clock mutt(clk);
d_flipflop_bh mut(.q(q),.qbar(qbar),.d(d),.clk(clk));



initial begin



$display("D flipflop demostration :");
$monitor("$time: %0t | clk : %0b | d: %0b |  q: %0b | qbar: %0b",$time,clk,d,q,qbar);
d=0;
#10
d=1;
#5

$finish;

   
end

initial begin
    $dumpfile("d_flipflop.vcd");
    $dumpvars(0,d_flipflop_tb);
end
endmodule