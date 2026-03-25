module full_subtracter_df(output diff, output b_out, input a,b,b_in);

assign diff = a^b^b_in;
assign b_out=~a&(b^b_in)|(b&b_in);

endmodule

module full_subtracter_bh(output reg diff, output reg b_out, input a,b,b_in);

always @(*)
begin
  diff = a^b^b_in;
 b_out=~a&(b^b_in)|(b&b_in);  
end


endmodule

module full_subtracter_gate(output diff, output b_out, input a,b,b_in);
wire w1,w2,w3;
xor(w1,b,b_in);
xor(diff,w1,a);
not(w2,a);
and(w2,w1);
and(w3,b,b_in);
or(w2,w3);
endmodule