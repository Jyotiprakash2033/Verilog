`timescale 1ns/1ns

//TODO iverilog sized_numbers.v
//TODO vvp a.out

module sized_numbers(

output reg [7:0] a,
output reg [7:0] b,
output reg [7:0] c,
output reg [7:0] d,
output reg [3:0] e,
output reg [7:0] f

);

initial begin

a = 8'b10101010;
b = 8'd170;
c = 8'o252;
d = 8'hAA;

e = 4'b101010;

f = 8'b1010;

end

endmodule