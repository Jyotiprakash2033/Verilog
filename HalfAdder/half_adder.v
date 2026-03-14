 module Half_adder_df(sum,carry,a,b);
 output sum, carry;
 input a,b;

 assign sum = a ^ b;
 assign carry = a & b;

 endmodule;

 module Half_adder_bh(sum,carry,a,b);
 output reg sum, carry;
 input a,b;

 always @(*)
 begin 
    sum = a^b;
    carry = a&b;
 end
 endmodule;

 module half_adder_gl(sum, carry, a,b);
 input a, b;
 output sum, carry;

 xor u1(sum,a,b);
 and u2(carry,a,b);
endmodule;