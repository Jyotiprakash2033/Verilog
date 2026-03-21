
`include "../../FlipFlop/T_flipflop/t_flipflop.v"
module up_counter(q,t,clk , reset);
output [2:0] q;//array
// reg vec [3:0] ; //vector of 4 bit 
// reg [3:0] arr [4:0] ; //array of four element and each contain vector of 5 bit

wire [2:0] qbar;
input t,clk,reset;

  t_flipflop_bh t1(q[0],qbar[0],t,clk ,reset);
   t_flipflop_bh t2(q[1],qbar[1],t,qbar[0],reset);
   t_flipflop_bh t3(q[2],qbar[2],t,qbar[1],reset);
endmodule