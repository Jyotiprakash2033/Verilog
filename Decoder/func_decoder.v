// F(x,y,z) = Σ(1,3,5,7)

module function_using_decoder(f, x, y, z);

input x, y, z;
output f;

wire d0, d1, d2, d3, d4, d5, d6, d7;

decoder dec1(x, y, z, d0, d1, d2, d3, d4, d5, d6, d7);

assign f = d1 | d3 | d5 | d7;

endmodule