module jk_flipflop_df(q,qbar,j,k,clk);
output  q,qbar;
input j,k,clk;

assign qbar= ~((qbar & j & clk) | q);
assign q = ~((q & k & clk) | qbar);
endmodule;

module jk_flipflop_bh(q, qbar, j, k, clk);
 output reg q;
 output qbar;
 input j, k, clk;
assign qbar = ~q;//assign with wire 
 always @(posedge clk) 
 begin
    case({j,k})
    2'b00: q = q;
    2'b01: q = 0;
    2'b10: q = 1;
    2'b11: q =~q; 
    endcase
 end
endmodule

module jk_flipflop_gate(q,qbar,j,k,clk);
output q;
output qbar;
input j,k;
input clk;


wire w1,w2;

and u1(w1,qbar,j,clk);
nor u2(qbar,w1,q);
and u3(w2,q,k,clk);
nor u4(q,w2,qbar);
endmodule
