`timescale 1ns/1ns
`include "half_adder.v"

//TODO iverilog -o .\half_adder.vvp .\half_adder_tb.v
//* vvp .\half_adder.vvp
//? gtkwave.exe .\half_adder.vcd
module Half_adder_tb;
wire sum,carry;
reg a,b;
// Half_adder_df mut(.sum(sum),.carry(carry),.a(a),.b(b));
// Half_adder_bh mut(.sum(sum),.carry(carry),.a(a),.b(b));
Half_adder_gl mut(.sum(sum),.carry(carry),.a(a),.b(b));

initial begin
    $display("halfAdder demonstration ");

    $monitor(" time : %0t | a : %0b| b:%0b | sum : %0b | carry : %0b",$time,a,b,sum,carry  );
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

initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0,Half_adder_tb);
end
endmodule