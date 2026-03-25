`timescale 1ps/1ps
`include "exercise3.v"
//!iverilog -o .\question_1.vvp .\exercise_tb.v

module exercise_tb();


// question_1 mut();
// question_2 mutt();
// question_3 mutt();

question_5 mut();
initial begin
    $dumpfile("exercise_tb.vcd");
    $dumpvars(0,exercise_tb);
end
endmodule