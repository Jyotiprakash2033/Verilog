module Full_Adder_gl(sum,c_out,a,b,c_in);
 output sum,c_out;
input a,b,c_in;
wire w1,w2,w3;

xor u1(w1,a,b);
xor u2(sum,w1,c_in);

and u3(w2,w1,c_in);
and u4(w3,a,b);
or u5(c_out,w2,w3);

endmodule

module full_adder_4bit(sum,c_out,a,b,c_in);
output [3:0] sum;
output c_out;
input [3:0] a,b;
input c_in;

wire [2:0] c;
// or reg c1,c1,c3

Full_Adder_gl f1(.sum(sum[0]),.c_out(c[0]),.a(a[0]),.b(b[0]),.c_in(c_in));
Full_Adder_gl f2(.sum(sum[1]),.c_out(c[1]),.a(a[1]),.b(b[1]),.c_in(c[0]));
Full_Adder_gl f3(.sum(sum[2]),.c_out(c[2]),.a(a[2]),.b(b[2]),.c_in(c[1]));
Full_Adder_gl f4(.sum(sum[3]),.c_out(c_out),.a(a[3]),.b(b[3]),.c_in(c[2]));

endmodule