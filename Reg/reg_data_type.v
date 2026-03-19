//======================================================
// Verilog REG Data Types Demonstration
//======================================================

module reg_datatypes_demo;


//------------------------------------------------------
// 1. Scalar reg
//------------------------------------------------------
// Size: 1 bit
// Use: single control signals, flags, enables

reg flag;


//------------------------------------------------------
// 2. Vector reg
//------------------------------------------------------
// Size: user defined 
// Use: buses, registers, ALU operands

reg [7:0] byte_data;     // 8-bit register
reg [15:0] word_data;    // 16-bit register


//------------------------------------------------------
// 3. Signed reg
//------------------------------------------------------
// Size: defined width
// Use: arithmetic operations with signed numbers

reg signed [7:0] signed_val;


//------------------------------------------------------
// 4. Integer
//------------------------------------------------------
// Size: 32-bit signed
// Use: loop counters, simulation variables

integer i;


//------------------------------------------------------
// 5. Time
//------------------------------------------------------
// Size: 64-bit unsigned
// Use: simulation time storage

time sim_time;


//------------------------------------------------------
// 6. Real
//------------------------------------------------------
// Size: 64-bit floating point
// Use: testbench math calculations

real voltage;


//------------------------------------------------------
// Demonstration
//------------------------------------------------------

initial begin

    // scalar (1 bit)
    flag = 1'b1;
    $display("flag        : bin = %b", flag);

    // vectors
    byte_data = 8'hA5;
    word_data = 16'h1234;
    $display("byte_data   : hex = %h , bin = %b", byte_data, byte_data);
    $display("word_data   : hex = %h , bin = %b", word_data, word_data);

    // signed value
    signed_val = -8'd10;
    $display("signed_val  : dec = %d , bin = %b", signed_val, signed_val);

    // integer (32-bit signed)
    i = 10;
    $display("integer i   : dec = %0d , bin = %b", i, i);

    // time (64-bit unsigned simulation time)
    sim_time = $time;
    $display("sim_time    : time = %0t , bin = %b", sim_time, sim_time);

    // real (floating point)
    voltage = 3.3;
    $display("voltage     : real = %f", voltage);

end

endmodule