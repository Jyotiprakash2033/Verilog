module t_flipflop_df(q,qbar,t,clk);
output  q,qbar;
input t,clk;

assign qbar= ~((qbar & t & clk) | q);
assign q = ~((q & t & clk) | qbar);
endmodule;

module t_flipflop_bh(q, qbar, t, clk,reset);
 output reg q;
 output qbar;
 input t, clk,reset;
assign qbar = ~q;//assign with wire 

initial 
q =0;
 always @(posedge clk) 
 begin
    case({t,reset})
    2'b00: q=q;
    2'b10: q=~q;
    2'b11: q=0;
    2'b01: q=0;
    endcase
 end
endmodule

module t_flipflop_gate(q,qbar,t,clk);
output q;
output qbar;
input t;
input clk;


wire w1,w2;

and u1(w1,qbar,t,clk);
nor u2(qbar,w1,q);
and u3(w2,q,t,clk);
nor u4(q,w2,qbar);
endmodule
