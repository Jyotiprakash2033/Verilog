`timescale 1ns/1ns

// ---------------- DESIGN MODULE ----------------

module always_demo(

input clk,
input rst,
input a,
input b,
input [3:0] sel,

output reg and_out,
output reg or_out,
output reg xor_out,

output reg [7:0] counter,

output reg mux_out,

output reg [3:0] case_out

);


// ---------- Combinational Logic ----------

always @(*) begin

    and_out = a & b;
    or_out  = a | b;
    xor_out = a ^ b;

end



// ---------- Sequential Logic (Counter) ----------

always @(posedge clk or posedge rst) begin

    if(rst)
        counter <= 0;

    else
        counter <= counter + 1;

end



// ---------- If-Else Example ----------

always @(*) begin

    if(a)
        mux_out = b;
    else
        mux_out = ~b;

end



// ---------- Case Statement ----------

always @(*) begin

    case(sel)

        4'b0001: case_out = 1;
        4'b0010: case_out = 2;
        4'b0100: case_out = 4;
        4'b1000: case_out = 8;

        default: case_out = 0;

    endcase

end


endmodule



// ---------------- TESTBENCH ----------------

module always_demo_tb;

reg clk;
reg rst;
reg a;
reg b;
reg [3:0] sel;

wire and_out;
wire or_out;
wire xor_out;

wire [7:0] counter;

wire mux_out;

wire [3:0] case_out;


// Instantiate module

always_demo uut(
clk,rst,a,b,sel,
and_out,or_out,xor_out,
counter,
mux_out,
case_out
);


// Clock generation

always #5 clk = ~clk;



initial begin

$dumpfile("always_demo.vcd");
$dumpvars(0,always_demo_tb);

clk = 0;
rst = 1;
a = 0;
b = 0;
sel = 0;

#10 rst = 0;

#10 a = 1; b = 0;
#10 a = 1; b = 1;

#10 sel = 4'b0001;
#10 sel = 4'b0100;
#10 sel = 4'b1000;

#50 $finish;

end

endmodule