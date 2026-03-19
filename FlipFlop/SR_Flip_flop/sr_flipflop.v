module sr_flipflop_df(q,qbar,s,r,clk);
output q,qbar;
input s,r,clk;
reg w1,w2;

assign qbar = ~((s&clk) | q);
assign q = ~((r & clk) | qbar);
endmodule

module sr_flip_flop_bh(q,qbar,s,r,clk);
output reg q;
output qbar;
input s,r,clk;

assign qbar = ~q;

always @(posedge clk )
begin
    case({s,r})
    2'b11: q=1'bx;
    2'b10: q=1;
    2'b01: q=0;
    endcase
end
endmodule
module sr_flipflop_gate(q,qbar,s,r,clk);
output q,qbar;
input s,r,clk;
wire w1,w2;

and u1 (w1,s,clk);
nor u2(qbar,w1,q);
and u3(w2,r,clk);
nor u4(q,w2,qbar);

endmodule