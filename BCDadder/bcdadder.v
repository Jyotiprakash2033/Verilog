module four_bit_adder(
    input  [3:0] A,
    input  [3:0] B,
    input  C0,
    output [3:0] S,
    output C4
);
    assign {C4, S} = A + B + C0;
endmodule

module bcd_adder (
    input  [3:0] A,
    input  [3:0] B,
    input  Cin,
    output [3:0] S,
    output Cout
);

wire carry, carry1;
wire [3:0] sum, b;
wire z;

// First binary addition
four_bit_adder Add1 (
    .A(A),
    .B(B),
    .C0(Cin),
    .S(sum),
    .C4(carry)
);

// Correction detection
assign z = (sum[3] & sum[2]) | (sum[3] & sum[1]) | carry;

// If correction needed, add 0110
assign b = {1'b0, z, z, 1'b0};

// Second addition
four_bit_adder Add2 (
    .A(sum),
    .B(b),
    .C0(1'b0),
    .S(S),
    .C4(carry1)
);

// Final carry output
assign Cout = z;

endmodule

/*
Decimal   Binary Sum   BCD Output
0         0 0000        0 0000
1         0 0001        0 0001
2         0 0010        0 0010
3         0 0011        0 0011
4         0 0100        0 0100
5         0 0101        0 0101
6         0 0110        0 0110
7         0 0111        0 0111
8         0 1000        0 1000
9         0 1001        0 1001
10        0 1010        1 0000
11        0 1011        1 0001
12        0 1100        1 0010
13        0 1101        1 0011
14        0 1110        1 0100
15        0 1111        1 0101
16        1 0000        1 0110
17        1 0001        1 0111
18        1 0010        1 1000
19        1 0011        1 1001
*/