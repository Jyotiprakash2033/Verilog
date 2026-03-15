`timescale 1ps/1ps
`include "nor_latch.v"


module nor_latch_tb;

wire q,qbar;
reg s,r;

// Nand_latch_df mut(.q(q),.qbar(qbar),.s(s),.r(r));

nor_latch_bh mut(.q(q),.qbar(qbar),.s(s),.r(r));
// Nand_latch_gl mut(.q(q),.qbar(qbar),.s(s),.r(r));
initial begin
$display("nor_latch demostration :");
$monitor("$time: %0t | s: %0b | r: %0b | q: %0b | qbar: %0b",$time,s,r,q,qbar);

#5
s=1; r=1;
#5
s=1; r=0;
#5
s=0; r=0;
#5
s=0; r=1;
#5
s=0; r=0;
#5
$finish;
end

initial begin
    $dumpfile("nor_latch.vcd");
    $dumpvars(0,nor_latch_tb);
end


endmodule