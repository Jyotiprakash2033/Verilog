`timescale 1ps/1ps
`include "comparater.v"

module comparater_tb();
wire a_greater_b,a_less_b,a_equal_b;
reg a,b;

comparater mut(a_greater_b,a_less_b,a_equal_b,a,b);
initial begin
    $dumpfile("comparater_tb.vcd");
    $dumpvars(0,comparater_tb);

    $display("comparater testbench");
     $display("$time\t|a\t|b\t|a_greater_b\t|a_less_b\t|a_equal_b\t");
    $monitor("%0t\t|%0b\t|%0b\t|%0b\t\t|%0b\t\t|%0b\t\t",$time,a,b,a_greater_b,a_less_b,a_equal_b);
    #5;
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