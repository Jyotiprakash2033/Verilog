module decoder(x, y, z, en, d0, d1, d2, d3, d4, d5, d6, d7);
  input x, y, z;      // Select inputs
  input en;           // Enable input
  output d0, d1, d2, d3, d4, d5, d6, d7;

  // Decoder works only when en = 1
  assign d0 = en & ~x & ~y & ~z;
  assign d1 = en & ~x & ~y &  z;
  assign d2 = en & ~x &  y & ~z;
  assign d3 = en & ~x &  y &  z;
  assign d4 = en &  x & ~y & ~z;
  assign d5 = en &  x & ~y &  z;
  assign d6 = en &  x &  y & ~z;
  assign d7 = en &  x &  y &  z;

endmodule