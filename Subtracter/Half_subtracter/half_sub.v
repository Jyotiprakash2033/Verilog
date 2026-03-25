module half_subtracter_df(output diff, output borrow, input a,b);

assign diff = a^b;
assign borrow=(~a)&b;

endmodule

module half_subtracter_bh(output reg diff, output reg borrow, input a,b);

always @(*)
begin
  diff = a^b;
borrow=(~a)&b;  
end


endmodule

module half_subtracter_gate(output diff, output borrow, input a,b);
wire w1;
xor(diff,a,b);
not(w1,a);
and(w1,b);
endmodule