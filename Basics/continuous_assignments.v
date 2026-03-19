// ============================================================
// 1. Continuous Assignment (Basic Example)
// Demonstrate the use of continuous assignment for:
//  - Basic logic operations
//  - Vector operations
//  - Concatenation with carry
// ============================================================

module continuous_assign_examples (
    out,
    addr,
    c_out,
    sum,
    i1,
    i2,
    addr1_bits,
    addr2_bits,
    a,
    b,
    c_in
);

    // ---------------- INPUTS ----------------
    input wire i1, i2;                   // Single-bit inputs
    input wire [15:0] addr1_bits;        // 16-bit input
    input wire [15:0] addr2_bits;        // 16-bit input
    input wire [3:0] a, b;               // 4-bit operands
    input wire c_in;                     // Carry input


    // ---------------- OUTPUTS ----------------
    output wire out;                     // Result of AND
    output wire [15:0] addr;             // XOR result
    output wire [4:0] c_out;             // Carry result (5 bits)
    output wire [3:0] sum;               // 4-bit sum


    // ---------------- CONTINUOUS ASSIGNMENTS ----------------

    // Logical AND operation
    assign out = i1 & i2;

    // Bitwise XOR of two 16-bit vectors
    assign addr = addr1_bits ^ addr2_bits;

    // Concatenation example:
    // The result of addition is 5 bits -> {carry, sum}
    assign {c_out, sum} = a + b + c_in;

endmodule



// ============================================================
// 2. Implicit vs Regular Continuous Assignment
// Compare regular and delayed continuous assignment
// ============================================================

module implicit_vs_regular_assign (
    out_regular,
    out_implicit,
    i1,
    i2
);

    // ---------------- INPUTS ----------------
    input wire i1, i2;

    // ---------------- OUTPUTS ----------------
    output wire out_regular;     // Normal continuous assignment
    output wire out_implicit;    // Continuous assignment with delay


    // Regular continuous assignment
    assign out_regular = i1 & i2;

    // Continuous assignment with delay
    // Output changes 10 time units after input changes
    assign #10 out_implicit = i1 & i2;

endmodule