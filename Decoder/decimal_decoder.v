module bcd_to_decimal_decoder(w, x, y, z, f0, f1, f2, f3, f4, f5, f6, f7, f8, f9);

input w, x, y, z;
output f0, f1, f2, f3, f4, f5, f6, f7, f8, f9;

// Each output is 1 only for its corresponding BCD input
assign f0 = ~w & ~x & ~y & ~z;   // 0000
assign f1 = ~w & ~x & ~y &  z;   // 0001
assign f2 = ~w & ~x &  y & ~z;   // 0010
assign f3 = ~w & ~x &  y &  z;   // 0011
assign f4 = ~w &  x & ~y & ~z;   // 0100
assign f5 = ~w &  x & ~y &  z;   // 0101
assign f6 = ~w &  x &  y & ~z;   // 0110
assign f7 = ~w &  x &  y &  z;   // 0111
assign f8 =  w & ~x & ~y & ~z;   // 1000
assign f9 =  w & ~x & ~y &  z;   // 1001

endmodule