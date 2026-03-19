`timescale 1ps/1ps
`include "sr_flipflop.v"
`include "../../Clock/clock_demo.v"

module sr_flipflop_tb();
wire q,qbar ;
reg s,r;
wire clk;

// reg c=1'b0;

// wire clk ;
// always #5 c=~c;

// assign clk = c;
my_clock mutt(clk);
sr_flip_flop_bh mut(.q(q),.qbar(qbar),.s(s),.r(r),.clk(clk));

initial begin

$display("nor_latch demostration :");
$monitor("$time: %0t | clk : %0b | s: %0b | r: %0b | q: %0b | qbar: %0b",$time,clk,s,r,q,qbar);
#5
s=0; r=0;
#10
s=0; r=1;
#10
s=1; r=0;
#10
s=1; r=1;
#10

$finish;

   
end

initial begin
    $dumpfile("sr_flipflop.vcd");
    $dumpvars(0,sr_flipflop_tb);
end





endmodule