module D (out, a, b, c);
output out;
input a, b, c;
wire e;
and #(5) a1(e, a, b); // Delay of 5
or #(4) o1(out, e, c); // Delay of 4
endmodule