`timescale 1ps/1ps
`include "half_sub.v"

module half_subtracter_tb();
wire diff;
wire borrow;
reg a,b;
half_subtracter_df mut(.diff(diff),.borrow(borrow),.a(a),.b(b));
// half_subtracter_bh mut(.diff(diff),.borrow(borrow),.a(a),.b(b));
// half_subtracter_gate mut(.diff(diff),.borrow(borrow),.a(a),.b(b));

initial begin
    $dumpfile("half_subtracter.vcd");
    $dumpvars(0,half_subtracter_tb);

    $display("half subtracter demonstration");
    $display("$time\t| a\t| b\t| diff\t | borrow\t ");
    $monitor("%0t\t| %0b\t| %0b\t| %0b\t | %0b\t",$time,a,b,diff,borrow);

    #5
    a=0;b=0;
    #5
    a=0;b=1;
    #5
    a=1;b=0;
    #5
    a=1;b=1;
    #5

    $finish;
end
endmodule