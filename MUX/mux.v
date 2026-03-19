// 4 to 1 mux

module mux_4to1_df(cout,i0,i1,i2,i3,s0,s1);
 output cout;
 input i0,i1,i2,i3;
 input s0,s1;

 assign cout = ((~s0 & ~s1 & i0) |(s0 & ~s1 & i1) |(s1 & ~s0 & i2) | (s0 & s1 & i3));
endmodule

module mux_4to1_bh(cout,i0,i1,i2,i3,s0,s1);
  output reg cout;
  input i0,i1,i2,i3;
  input s0,s1;

  always @(*)
  begin
     cout = ((~s0 & ~s1 & i0) |(s0 & ~s1 & i1) |(s1 & ~s0 & i2) | (s0 & s1 & i3));
  end
endmodule

module mux_4to1_gate(cout,i0,i1,i2,i3,s0,s1);
  output cout;
  input i0,i1,i2,i3;
  input s0,s1;
  wire w1,w2,w3,w4;
 
 and u1(w1,~s0,~s1,i0);
 and u2(w2,s0,~s1,i1);
 and u3(w3,s1,~s0,i2);
 and u4(w4,s0,s1,i3);

 or u5(cout,w1,w2,w3,w4);

endmodule