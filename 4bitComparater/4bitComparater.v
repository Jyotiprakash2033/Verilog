module comparater_4bit(a_greater_b,a_less_b,a_equal_b,a,b);
output a_greater_b,a_less_b,a_equal_b;
input [3:0] a,b;

assign a_greater_b =(( a[3] & ~b[3] )|
                    (~(a[3]^b[3]) & (a[2] & ~b[2]))|
                    (~(a[3]^b[3]) &  ~(a[2]^b[2]) & (a[1] & ~b[1])) |
                    ( ~(a[3]^b[3]) &  ~(a[2]^b[2]) & ~(a[1]^b[1]) & (a[0] &~b[0])));

assign a_less_b = ((~a[3] &b[3]) |
                   (~(a[3] ^b[3]) & (~a[2] &b[2])) |
                   (~(a[3]^b[3]) & (~(a[2]^b[2])) & (~a[1] &b[1])) |
                   (~(a[3]^b[3]) & (~(a[2]^b[2])) & (~(a[1] ^b[1]))& (~a[0]&b[0]) ));

assign a_equal_b =(~(a[3]^b[3]) & ~(a[2] ^b[2]) & ~(a[1] ^b[1]) & ~(a[0] ^b[0]));

endmodule