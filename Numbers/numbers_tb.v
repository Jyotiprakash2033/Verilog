'timescale 1ns/1ns
'include "sized_numbers.v"
'include "unsized_numbers.v"
'include "xz_negative_numbers"

module sized_numbers_tb ;

wire [7:0] a;
wire [7:0] b;
wire [7:0] c;
wire [7:0] d;
wire [3:0] e;
wire [7:0] f;

sized_numbers uut (a,b,c,d,e,f);

initial begin

#5;

$display("Binary      a = %b", a);
$display("Decimal     b = %d", b);
$display("Octal       c = %o", c);
$display("Hexadecimal d = %h", d);

$display("\nTruncation Example");
$display("4'b101010 stored in 4 bits = %b", e);

$display("\nZero Extension Example");
$display("8'b1010 stored in 8 bits = %b", f);

#5 $finish;

end
    
endmodule