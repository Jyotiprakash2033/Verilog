module d_flipflop_df(q,qbar,d,clk);
output  q,qbar;
input d,clk;

assign qbar= ~((qbar & d & clk) | q);
assign q = ~((q & ~d & clk) | qbar);
endmodule;

module d_flipflop_bh(q, qbar, d, clk);
 output reg q;
 output qbar;
 input d, clk;
assign qbar = ~q;//assign with wire 

 always @(posedge clk) 
 begin
    q=d;
 end
endmodule

module d_flipflop_gate(q,qbar,d,clk);
output q;
output qbar;
input d;
input clk;


wire w1,w2;

and u1(w1,qbar,d,clk);
nor u2(qbar,w1,q);
and u3(w2,q,~d,clk);
nor u4(q,w2,qbar);
endmodule
