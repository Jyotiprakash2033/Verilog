`timescale 1ps/1ps
`include "reset.v"

module reset_tb();
wire reset;

 my_reset mut(reset);

initial begin
    $dumpfile("reset.vcd");
    $dumpvars(0,reset_tb);
end
endmodule