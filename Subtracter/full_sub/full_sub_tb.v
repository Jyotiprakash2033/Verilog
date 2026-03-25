`timescale 1ps/1ps
`include "full_sub.v"

module full_subtracter_tb();
wire diff;
wire b_out;
reg a,b,b_in;
full_subtracter_df mut(.diff(diff),.b_out(b_out),.a(a),.b(b),.b_in(b_in));
// full_subtracter_bh mut(.diff(diff),.b_out(b_out),.a(a),.b(b),.b_in(b_in));
// full_subtracter_gate mut(.diff(diff),.b_out(b_out),.a(a),.b(b),.b_in(b_in));

initial begin
    $dumpfile("full_subtracter.vcd");
    $dumpvars(0,full_subtracter_tb);

    $display("full subtracter demonstration");
    $display("$time\t| a\t| b\t| b_in\t| diff\t| b_out\t");
    $monitor("%0t\t| %0b\t| %0b\t| %0b\t| %0b\t| %0b\t",$time,a,b,b_in,diff,b_out);
  #5
    a=0; b=0; b_in=0;
    #5
    a=0; b=0; b_in=1;
    #5
    a=0; b=1; b_in=0;
    #5
    a=0; b=1; b_in=1;
    #5
    a=1; b=0; b_in=0;
    #5
    a=1; b=0; b_in=1;
    #5
    a=1; b=1; b_in=0;
    #5
    a=1; b=1; b_in=1;
    #5
   
    $finish;
end
endmodule