
// ============================================================================
// TESTBENCH
// ----------------------------------------------------------------------------
// This testbench applies random values to:
//   a = 0 to 7
//   b = 0 to 15
//
// and observes the 7-bit product.
//
// Note:
// This is a simple random testbench, not exhaustive.
// ============================================================================

module testbench;
    // Inputs
    reg [2:0] a;
    reg [3:0] b;

    // Output
    wire [6:0] out;

    // DUT instantiation
    product dut (
        .a(a),
        .b(b),
        .res(out)
    );

    // Clock and reset
    reg clk;
    reg rst;

    // Test counter
    reg [3:0] i;

    // ------------------------------------------------------------------------
    // Initial values
    // ------------------------------------------------------------------------
    initial begin
        clk = 0;
        rst = 1;
        a   = 0;
        b   = 0;
        #20;
        rst = 0;
    end

    // ------------------------------------------------------------------------
    // Clock generation: toggles every 10 time units
    // ------------------------------------------------------------------------
    always begin
        #10 clk = ~clk;
    end

    // ------------------------------------------------------------------------
    // Apply random test inputs on each positive clock edge
    // ------------------------------------------------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            i = 0;
        end
        else begin
            // Random valid range for inputs
            a <= $random % 8;    // 3-bit input: 0 to 7
            b <= $random % 16;   // 4-bit input: 0 to 15

            i = i + 1;

            if (i == 10)
                $finish;
        end
    end

    // ------------------------------------------------------------------------
    // Display current values whenever they change
    // ------------------------------------------------------------------------
    initial begin
        $monitor("%0t: a = %b (%0d), b = %b (%0d), res = %b (%0d)",
                 $time, a, a, b, b, out, out);
    end

endmodule