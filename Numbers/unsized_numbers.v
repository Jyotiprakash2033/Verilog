`timescale 1ns/1ns

module unsized_numbers;

reg [31:0] a;
reg [31:0] b;
reg [31:0] c;

reg [7:0] small_reg;

initial begin

// ---------- Unsized Decimal ----------

a = 25;    // automatically 32-bit

$display("Unsized decimal 25 = %d", a);
$display("Binary form      = %b", a);


// ---------- Unsized Hex ----------

b = 'hFF;

$display("\nUnsized hex 'hFF = %h", b);
$display("Binary form       = %b", b);


// ---------- Unsized Binary ----------

c = 'b1010;

$display("\nUnsized binary 'b1010 = %b", c);


// ---------- Assigning Unsized to Smaller Register ----------

small_reg = 300;    // 300 exceeds 8 bits

$display("\nAssigning 300 to 8-bit register");
$display("Stored value = %d", small_reg);
$display("Binary value = %b", small_reg);

end

endmodule