`timescale 1ns/1ns


// ---------------- DESIGN MODULE ----------------

module assign_demo(

input  [7:0] a,
input  [7:0] b,

output [7:0] add,
output [7:0] sub,
output [7:0] mul,

output and_bit,
output or_bit,
output xor_bit,

output logic_and,
output logic_or,

output greater,
output equal,

output [7:0] mux_out,

output [7:0] const_add,
output [7:0] neg_example,

output [15:0] concat_example,

output [7:0] delayed_sum

);


// ---------- Arithmetic ----------

assign add = a + b;
assign sub = a - b;
assign mul = a * b;


// ---------- Bitwise ----------

assign and_bit = a[0] & b[0];
assign or_bit  = a[0] | b[0];
assign xor_bit = a[0] ^ b[0];


// ---------- Logical ----------

assign logic_and = (a > 0) && (b > 0);
assign logic_or  = (a > 0) || (b > 0);


// ---------- Relational ----------

assign greater = (a > b);
assign equal   = (a == b);


// ---------- Conditional (MUX) ----------

assign mux_out = (a > b) ? a : b;


// ---------- Constant Example ----------

assign const_add = a + 8'd5;


// ---------- Negative Example ----------

assign neg_example = -a;


// ---------- Concatenation ----------

assign concat_example = {a,b};


// ---------- Continuous Assignment Delay ----------

assign #5 delayed_sum = a + b;


endmodule




// ---------------- TESTBENCH ----------------

module assign_demo_tb;

reg [7:0] a;
reg [7:0] b;

wire [7:0] add;
wire [7:0] sub;
wire [7:0] mul;

wire and_bit;
wire or_bit;
wire xor_bit;

wire logic_and;
wire logic_or;

wire greater;
wire equal;

wire [7:0] mux_out;

wire [7:0] const_add;
wire [7:0] neg_example;

wire [15:0] concat_example;

wire [7:0] delayed_sum;


// Instantiate module

assign_demo uut(
a,b,
add,sub,mul,
and_bit,or_bit,xor_bit,
logic_and,logic_or,
greater,equal,
mux_out,
const_add,
neg_example,
concat_example,
delayed_sum
);


initial begin

$monitor("time=%0t  a=%d b=%d  add=%d delayed_sum=%d",$time,a,b,add,delayed_sum);

a = 10; b = 5;
#10;

a = 20; b = 4;
#10;

a = 7; b = 3;
#10;

$finish;

end

endmodule