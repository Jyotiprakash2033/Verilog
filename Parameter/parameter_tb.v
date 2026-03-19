`timescale 1ns/1ns
`include "parameters.v"  

module parameters_tb;

//==============================================================
// PARAMETER OVERRIDING AT MODULE INSTANTIATION
//==============================================================
// Parameters can be overridden during module instantiation.
// Two methods exist:
// 1) Named parameter assignment
// 2) Ordered parameter assignment


//--------------------------------------------------------------
// parameters module instantiation
//--------------------------------------------------------------

// Default parameters
parameters mut_default();

// Named parameter override
parameters #(.cache_line_width(32)) mut_override();
// Overrides cache_line_width from default 256 → 32


wire data_out;
wire data_in;
wire address;


// Named parameter assignment (recommended)

memory #(.DATA_WIDTH(32), .ADDR_WIDTH(12))
mem_instance1 (data_out, data_in, address);


// Ordered parameter assignment (less readable)

memory #(16, 8)
mem_instance2 (data_in, data_out, address);


//==============================================================
// ALU TEST SIGNALS
//==============================================================

parameter width = 32;     // Parameter used for ALU width

wire [width-1:0] a;
wire [width-1:0] b;
wire [3:0] opcode;
wire [width-1:0] result;


// Test stimulus

assign opcode = 4'b0010;  // Corresponds to state2 → subtraction
assign a = 32'h34567;
assign b = 32'd2;


//--------------------------------------------------------------
// ALU instantiation with parameter override
//--------------------------------------------------------------

alu #(.WIDTH(width))
alu_instance (
    .result(result),
    .a(a),
    .b(b),
    .opcode(opcode)
);


//--------------------------------------------------------------
// INVALID example (cannot override localparam)
//--------------------------------------------------------------

// alu #(.WIDTH(width), .state1(4'b1000)) alu_instance(...);
// ❌ Illegal: state1 is declared as localparam in the ALU module
// localparam cannot be overridden externally


//--------------------------------------------------------------
// Waveform dump for GTKWave
//--------------------------------------------------------------

initial begin

    $dumpfile("parameters.vcd");   // Output waveform file
    $dumpvars(0, parameters_tb);   // Dump all signals in this module

end

endmodule