`timescale 1ns/1ns

module special_values;

reg [7:0] a;
reg [7:0] b;

reg [3:0] c;
reg [3:0] d;

reg signed [7:0] e;
reg signed [7:0] f;

initial begin

// ---------- Unknown Values (x) ----------

a = 8'b1010xxxx;

$display("Unknown bits example");
$display("a = %b", a);


// ---------- High Impedance (z) ----------

b = 8'bzzzz1010;

$display("\nHigh impedance example");
$display("b = %b", b);


// ---------- Mixed x and z ----------

c = 4'b1xz0;

$display("\nMixed x and z");
$display("c = %b", c);


// ---------- Negative Numbers ----------

e = -8'd5;
f = -8'd12;

$display("\nNegative numbers");
$display("e = %d  (binary = %b)", e, e);
$display("f = %d  (binary = %b)", f, f);


// ---------- Demonstrating 2's complement ----------

d = -4'd3;

$display("\n2's complement example");
$display("-3 stored in 4 bits = %b", d);

end

endmodule