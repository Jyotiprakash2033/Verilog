`timescale 1ps/1ps
`include "jk_flipflop.v"
`include "../../Clock/clock_demo.v"


module jk_flipflop_tb();

wire q, qbar;
reg j,k;
wire clk;

my_clock mutt(clk);
jk_flipflop_bh mut(.q(q),.qbar(qbar),.j(j),.k(k),.clk(clk));

initial begin

$display("jk flipflop demostration :");
$monitor("$time: %0t | clk : %0b | j: %0b | k: %0b | q: %0b | qbar: %0b",$time,clk,j,k,q,qbar);
#5
j=0; k=0;
#10
j=0; k=1;
#10
j=1; k=0;
#10
j=1; k=1;
#10

$finish;

   
end

initial begin
    $dumpfile("jk_flipflop.vcd");
    $dumpvars(0,jk_flipflop_tb);
end
endmodule