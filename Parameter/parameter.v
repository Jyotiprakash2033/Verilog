//==============================================================
// MACROS
//==============================================================
// `define creates compile-time text substitution macros.
// They are replaced by the preprocessor before compilation.

`define daffy_macro 32                 // Macro constant
`define daffy_macro_name "Daffy Verilog" // Macro string


//==============================================================
// MODULE : parameters
// Demonstrates parameters and macros
//==============================================================

module parameters;

//--------------------------------------------------------------
// PARAMETERS
//--------------------------------------------------------------
// Parameters are compile-time constants.
// They cannot be changed inside procedural blocks.

parameter port_id = 5;                 // Constant identifier
parameter cache_line_width = 256;      // Example system constant
parameter signed [15:0] WIDTH = 16;    // Signed parameter with bit-width

//--------------------------------------------------------------
// Using parameters and macros in declarations
//--------------------------------------------------------------

reg [cache_line_width-1:0] dummy1;     // Vector size determined by parameter
reg [`anish_macro-1:0] dummy2;         // Vector size determined by macro

//--------------------------------------------------------------
// Attempting to modify parameters
//--------------------------------------------------------------

initial begin
   // port_id = 4; 
   // ❌ Illegal: parameters are constants and cannot be assigned in procedural blocks

   // defparam can override parameters but is discouraged in modern RTL
   // because it breaks hierarchical clarity and readability.

   defparam port_id = 4;               // Parameter override (not recommended)
end


initial begin
   $display("port_id = %0d, cache_line_width = %0d, WIDTH = %0d",
             port_id, cache_line_width, WIDTH[15:0]);

   $display("anish_macro = %0d", `anish_macro);
   $display("anish_macro_name = %0s", `anish_macro_name);
end

endmodule



//==============================================================
// MODULE : memory
// Demonstrates parameterized modules
//==============================================================

// #(parameter ...) allows module parameters to be overridden
// during module instantiation.

module memory #(parameter DATA_WIDTH = 8, parameter ADDR_WIDTH = 16) (

 output data_out,
 output data_in,
 output address

);

// DATA_WIDTH determines the width of internal storage

reg [DATA_WIDTH-1:0] data;

initial begin

 // Assign lower 8 bits of data
 // Note: 4'hb = 1011 (4 bits) but automatically zero-extended

 data[7:0] = 4'hb;

 $display("data : %0h, Data_Width : %0d",
           data[DATA_WIDTH-1:0], DATA_WIDTH);

end

endmodule



//==============================================================
// LOCAL PARAMETERS
//==============================================================
// localparam defines constants that cannot be overridden
// externally or via defparam.


//==============================================================
// MODULE : alu
// Demonstrates parameterized datapath and localparams
//==============================================================

module alu #(parameter WIDTH = 8) (

 output [WIDTH-1:0] result,
 input  [WIDTH-1:0] a,
 input  [WIDTH-1:0] b,
 input  [3:0] opcode

);

// Internal register to hold computation result

reg [WIDTH-1:0] res;


//--------------------------------------------------------------
// Local parameters (internal constants)
//--------------------------------------------------------------
// Used for FSM states, opcode values, etc.
// Cannot be modified externally.

localparam state1 = 4'b0001;
localparam state2 = 4'b0010;
localparam state3 = 4'b0100;
localparam state4 = 4'b1000;


// Attempting modification

initial begin
 // defparam state1 = 4'b1000;
 // ❌ Illegal: localparam cannot be overridden
end


//--------------------------------------------------------------
// Combinational ALU logic
//--------------------------------------------------------------

always @(*) begin

  case (opcode)

    state1: res = (a + b);  // ADD
    state2: res = (a - b);  // SUB
    state3: res = (a & b);  // AND
    state4: res = (a | b);  // OR

    default: res = 0;

  endcase

  $display("Result : %0h", res);

end


//--------------------------------------------------------------
// Continuous assignment to output
//--------------------------------------------------------------

assign result = res;

endmodule