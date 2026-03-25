`timescale 1ps/1ps
`include "examples.v"
//!iverilog -o .\question_1.vvp .\examples_tb.v

module examples_tb();





initial begin
    $dumpfile("examples_tb.vcd");
    $dumpvars(0,examples_tb);
end
endmodule