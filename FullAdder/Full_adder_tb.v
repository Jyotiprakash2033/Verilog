`timescale 1ps/1ps
`include "full_adder.v"

module Full_adder_tb();

wire sum, c_out;
reg a,b,c_in;

Full_Adder_df mut(.sum(sum),.c_out(c_out),.a(a),.b(b),.c_in(c_in));
initial begin
    $display("Full adder demonstration");
    $monitor("time: %0t | a:%0b | b:%0b | c_in: %0b | sum : %0b | c_out : %0b",$time,a,b,c_in,sum,c_out);
    #5
    a=0; b=0; c_in=0;
    #5
    a=0; b=0; c_in=1;
    #5
    a=0; b=1; c_in=0;
    #5
    a=0; b=1; c_in=1;
    #5
    a=1; b=0; c_in=0;
    #5
    a=1; b=0; c_in=1;
    #5
    a=1; b=1; c_in=0;
    #5
    a=1; b=1; c_in=1;
    #5
    a=1; b=1'bx; c_in=1'bx;
    #5
    a=0; b=1'bx; c_in=0;
    #5
    $finish;

end

initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0,Full_adder_tb);
end
endmodule