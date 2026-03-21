`timescale 1ps/1ps
`include "full_adder.v"


module full_adder_4bit_tb ();       

wire [3:0] sum;
reg [3:0] a,b;
reg c_in;
wire c_out;

full_adder_4bit mut(.sum(sum),.c_out(c_out),.a(a),.b(b),.c_in(c_in));//inner value is for local function value(sum) and outer is for called function .sum

initial begin
    $display(" 4 bit full adder");
    $monitor(" $time : %0t | a: %0b | b :%0b | c_in : %0b | sum : %0b | c_out : %0b",$time,a,b,c_in,sum,c_out);

   
    #5
    a=4'b0000; b=4'b0000; c_in=0;
    #5
    a=4'b0110; b=4'b0001; c_in=1;
    #5
    a =4'b1110; b=4'b010x; c_in=0;
    #5
    a=4'b1111 ; b=4'b1010; c_in =1;
    #5
    $finish;

end

initial begin
    $dumpfile("full_adder_4bit_tb.vcd");
    $dumpvars(0,full_adder_4bit_tb);
end
endmodule