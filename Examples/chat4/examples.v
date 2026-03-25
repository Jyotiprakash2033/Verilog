module shift_reg(reg_out,clock,reg_in);
output reg [3:0] reg_out;// 4-bit output for shifted data
input [3:0] reg_in;// 4-bit input for parallel data

input clock;// 1-bit input for the clock signal

endmodule

/// question 4
module stimulus();
reg [3:0] REG_IN; // 4-bit input register
reg [3:0] REG_OUT;// 4-bit output wire
reg CLOCK;// 1-bit clock register

// Instantiate shift_reg using ordered list
 shift_reg sr1(REG_OUT,CLK, REG_IN);
endmodule



 //Question 5

 module stimulus;
 // Declare variables
reg [3:0] REG_IN; // 4-bit input register
reg CLK; // 1-bit clock register
wire [3:0] REG_OUT; // 4-bit output wire
 // Instantiate shift_reg using named connections
 shift_reg sr1(

 .clock(CLK),
 .reg_in(REG_IN),
 .reg_out(REG_OUT)
 );
 endmodule


//  Question 6:
//  Write the hierarchical names for variables REG_IN, CLK, and REG_OUT.

//  stimulus.REG_IN
//  stimulus.CLK
//  stimulus.REG_OUT




 // Question 7:
 // Write the hierarchical name for the instance sr1. Write the hierarchical names for its ports clock and reg_in.

// Hierarchical name for the instance:
//  stimulus.sr1

 // Hierarchical names for ports:

//  stimulus.sr1.clock
//  stimulus.sr1.reg_in
