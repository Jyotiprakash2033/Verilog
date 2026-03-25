`timescale 1ps/1ps
`include "examples.v"

module examples_tb();
reg a,b;
wire y_or , y_and , y_not;

my_and mut(.a(a),.b(b),.y(y_and));
my_or mutt(.a(a),.b(b),.y(y_or));
my_not muttt(.a(a),.y(y_not)) ; 
initial begin
    $monitor("a=%b | b=%b | y_and=%b |y_or=%b| y_not=%b",a,b,y_and,y_or,y_not);
    a = 0; b = 0; #5;
 a= 0; b = 1; #5;
 a= 1; b = 0; #5;
 a = 1; b= 1; #5;

$finish;
end
endmodule





