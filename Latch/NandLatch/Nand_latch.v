module Nand_latch_df(q,qbar,s,r);
output q,qbar;
input s,r;


assign q = ~(r & qbar);
assign qbar = ~(s & q);
endmodule

//? assign is only used with wire for continuous assignment
//! inside always block and initial block register is used

module Nand_latch_bh(q,qbar,s,r);
output reg q;
output reg qbar;
input s,r;



always @(*) begin
  q = ~(r & qbar);
 qbar = ~(s & q);
end
endmodule

module Nand_latch_rtl(q,qbar,s,r);
output reg q;
output qbar;
input s,r;

assign qbar = ~q;

always @(*) 
begin
    if(s==0 && r ==0) q=1'bx;
    else if(s==0 && r==1) q=1;
    else if(s==1 && r==0) q=0;
end





endmodule

module Nand_latch_gl(q,qbar,s,r);
output q,qbar;
input s,r;

nand u1(q,r,qbar);
nand u2(qbar,s,q);
endmodule