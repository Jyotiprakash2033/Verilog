module Full_Adder_df(sum,c_out,a,b,c_in);
output sum,c_out;
input a,b,c_in;

assign sum = a^b^c_in;
assign c_out = (a & b) | (c_in&(a^b));
endmodule

module Full_Adder_bh(sum,c_out,a,b,c_in);
output reg sum,c_out;
input a,b,c_in;
always @(*) begin
    sum = a^b^c_in;
    c_out = (a&b) | (c_in&(a^b));
end
endmodule

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