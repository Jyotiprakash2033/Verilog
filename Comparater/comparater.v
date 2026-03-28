module comparater(a_greater_b,a_less_b,a_equal_b,a,b);
output a_greater_b,a_less_b,a_equal_b;
input a,b;
assign a_greater_b = a & (~b);
assign a_less_b = (~a) & b;
assign a_equal_b = ~(a^b);
endmodule

module comparater_bh(a_greater_b,a_less_b,a_equal_b,a,b);
output reg a_greater_b,a_less_b,a_equal_b;
input a,b;
always @(*)
begin
a_greater_b = a&(~b);
 a_less_b = (~a) & b;
 a_equal_b = ~(a^b); 
end
endmodule

