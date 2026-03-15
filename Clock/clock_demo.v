`timescale 1ps/1ps

module my_clock(clk);
output clk;
reg c=1'b0;

always #5 c=~c;

assign clk = c;

endmodule