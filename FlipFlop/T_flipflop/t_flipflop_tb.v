`timescale 1ps/1ps
`include "t_flipflop.v"
`include "../../Clock/clock_demo.v"


module t_flipflop_tb();

wire q;
wire qbar;
reg t;
wire clk , reset;

my_clock mutt(clk);
t_flipflop_bh mut(.q(q),.qbar(qbar),.t(t),.clk(clk), .reset(reset));



initial begin



$display("t flipflop demostration :");
$monitor("$time: %0t | clk : %0b | reset : %0b | t: %0b |  q: %0b | qbar: %0b",$time,clk, reset,t,q,qbar);
t=0;
reset = 0 ;
#10
t=1;
#5 ;
t=1;
#5 ;
t=1;
#5 ;
reset = 1;
t=1;
#5 ;

$finish;

   
end

initial begin
    $dumpfile("t_flipflop.vcd");
    $dumpvars(0,t_flipflop_tb);
end
endmodule