`timescale 1ps/1ps
`include "mux.v"

module mux_tb();

wire cout;
reg i0,i1,i2,i3;
reg s0,s1;

// mux_4to1_df mut(.s0(s0),.s1(s1),.i0(i0),.i1(i1),.i2(i2),.i3(i3),.cout(cout));
// mux_4to1_bh mut(.s0(s0),.s1(s1),.i0(i0),.i1(i1),.i2(i2),.i3(i3),.cout(cout));
mux_4to1_gate mut(.s0(s0),.s1(s1),.i0(i0),.i1(i1),.i2(i2),.i3(i3),.cout(cout));

initial begin
   i0 =0 ; i1=0; i2 = 1; i3 =0;

 
    $display("mux demonstration");
    $monitor("$time : %0t | s0: %0b | s1 : %0b | i0 : %0b | i1 : %0b| i2 :%0b | i3 : %0b | cout : %0b" ,$time,s0,s1,i0,i1,i2,i3,cout);

    #5
    s0=0;s1=0;
    #5
    s0=0;s1=1;
    #5
    s0=1;s1=0;
    #5
    s0=1;s1=1;
    #5
    $finish;
end

initial begin
    $dumpfile("mux_tb.vcd");
    $dumpvars(0,mux_tb);
end
endmodule