`timescale 1ps/1ps
`include "FullAdder_lookahead.v"

module FullAdder_lookahead_tb();
wire [3:0] sum ;
wire c_out;
reg [3:0] a,b;
reg c_in;

fullAdder_lookahead_4bit mut(.sum(sum),.c_out(c_out),.a(a),.b(b),.c_in(c_in));

initial begin
    $display("FullAdder_lookahead");
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
    $dumpfile(" FullAdder_lookahead_tb.vcd");
    $dumpvars(0, FullAdder_lookahead_tb);
end
endmodule