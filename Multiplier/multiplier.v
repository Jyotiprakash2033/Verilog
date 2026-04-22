// ============================================================================
//? BINARY MULTIPLIER
// ----------------------------------------------------------------------------
// This is a 3-bit × 4-bit binary multiplier.
// Inputs:
//   a = 3-bit multiplier
//   b = 4-bit multiplicand
//
// Output:
//   res = 7-bit product
//
// Idea:
// Multiplication in binary is done using partial products.
// Each bit of multiplier 'a' is ANDed with all bits of multiplicand 'b'.
// That creates one partial-product row per multiplier bit.
//
// Since a has 3 bits:
//   a[0] creates partial product row r1
//   a[1] creates partial product row r2
//   a[2] creates partial product row r3
//
// These rows are then added with proper shifting:
//
//          b3 b2 b1 b0     multiplicand
//       ×        a2 a1 a0  multiplier
//       ----------------
//          r1             = b × a[0]
//       +  r2 << 1        = b × a[1], shifted by 1
//       +  r3 << 2        = b × a[2], shifted by 2
//       ----------------
//          final product
//
// Here:
//   res[0] comes directly from first partial product
//   then two 4-bit adders are used to add shifted rows
//
// Note:
//   CLA_Adder is used here as a 4-bit adder.
//   It must already be defined separately.
// ============================================================================

module product(a, b, res);
    input  [2:0] a;      // 3-bit multiplier
    input  [3:0] b;      // 4-bit multiplicand
    output [6:0] res;    // 7-bit product (max 7 × 15 = 105, needs 7 bits)

    // Partial products
    wire [4:0] r1;       // row for a[0], extra bit added for alignment
    wire [3:0] r2;       // row for a[1]
    wire [3:0] r3;       // row for a[2]

    // Intermediate sum after first addition
    wire [4:0] i1;

    // ------------------------------------------------------------------------
    // First partial product row: b AND a[0]
    // If a[0] = 1, row becomes b
    // If a[0] = 0, row becomes 0000
    // ------------------------------------------------------------------------
    assign r1[0] = b[0] & a[0];
    assign r1[1] = b[1] & a[0];
    assign r1[2] = b[2] & a[0];
    assign r1[3] = b[3] & a[0];
    assign r1[4] = 1'b0;   // extra 0 for 4-bit addition alignment

    // ------------------------------------------------------------------------
    // Second partial product row: b AND a[1]
    // This row is logically shifted left by 1 before addition
    // ------------------------------------------------------------------------
    assign r2[0] = b[0] & a[1];
    assign r2[1] = b[1] & a[1];
    assign r2[2] = b[2] & a[1];
    assign r2[3] = b[3] & a[1];

    // ------------------------------------------------------------------------
    // Third partial product row: b AND a[2]
    // This row is logically shifted left by 2 before addition
    // ------------------------------------------------------------------------
    assign r3[0] = b[0] & a[2];
    assign r3[1] = b[1] & a[2];
    assign r3[2] = b[2] & a[2];
    assign r3[3] = b[3] & a[2];

    // ------------------------------------------------------------------------
    // Least significant product bit comes directly from first row
    // because there is nothing to add into bit 0
    // ------------------------------------------------------------------------
    assign res[0] = r1[0];

    // ------------------------------------------------------------------------
    // First addition:
    // Add r1[4:1] and r2
    //
    // Why r1[4:1]?
    // Because r2 is effectively shifted left by 1, so alignment starts from bit 1.
    //
    // Result goes into i1:
    //   i1[0] = next product bit
    //   i1[4:1] = remaining bits for next stage
    // ------------------------------------------------------------------------
    CLA_Adder a1(
        r1[4:1],   // upper 4 bits of first row
        r2,        // second partial product row
        1'b0,      // carry-in = 0
        i1[3:0],   // sum output
        i1[4]      // carry output
    );

    // After first addition, lowest bit of this sum becomes res[1]
    assign res[1] = i1[0];

    // ------------------------------------------------------------------------
    // Second addition:
    // Add i1[4:1] and r3
    //
    // This corresponds to adding the third partial product row
    // after proper alignment.
    //
    // Final outputs:
    //   res[5:2] = middle product bits
    //   res[6]   = final carry / MSB of product
    // ------------------------------------------------------------------------
    CLA_Adder a2(
        i1[4:1],   // carry + upper bits from previous addition
        r3,        // third partial product row
        1'b0,      // carry-in = 0
        res[5:2],  // product bits 2 to 5
        res[6]     // most significant product bit
    );

endmodule