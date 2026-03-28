`timescale 1ps/1ps
`include "4bitComparater.v"

module comparater_tb();
wire a_greater_b,a_less_b,a_equal_b;
reg [3:0]a,b;

comparater_4bit mut(a_greater_b,a_less_b,a_equal_b,a,b);
initial begin
    $dumpfile("comparater.vcd");
    $dumpvars(0,comparater_tb);

    $display("comparater testbench");
    $display("$time\t|a\t|b\t|a_greater_b\t|a_less_b\t|a_equal_b\t");
    $monitor("%0t\t|%4b\t|%4b\t|%0b\t\t|%0b\t\t|%0b\t\t",$time,a,b,a_greater_b,a_less_b,a_equal_b);
    #5;
    a=4'b0110;b=4'b0000;
    #5
    a=4'b1110;b=4'b1111;
    #5
    a=4'b1111;b=4'b1111;
    #5
    a=4'b10x0;b=4'b1011;
    #5
    a=4'b10xx;b=4'b1001;
    #5
    $finish;

end
endmodule