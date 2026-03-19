// ============================================================
// Arithmetic Operations Example
// Demonstrates arithmetic and modulus operations
// ============================================================

module arithmetic_operations;

    real a, b, pow;          // floating point numbers
    integer d, e;            // integers

    reg [3:0] sum, diff;     // arithmetic results
    reg mod;                 // modulus
    integer div;             // division result

    initial begin

        $monitor("Time=%0t | a=%b b=%b d=%0d e=%0d | sum=%b diff=%b mod=%b div=%0d pow=%0d",
                 $time, a, b, d, e, sum, diff, mod, div, pow);

        // Test Case 1
        a = 4'b0101; 
        b = 4'b0011;

        d = 7;
        e = 3;

        sum  = a + b;
        diff = b - a;
        div  = d / e;
        mod  = d % e;
        pow  = d ** e;

        #10;

        // Test Case 2
        a = 4'b1010;
        b = 4'b1100;

        d = 16;
        e = 4;

        sum  = a + b;
        diff = b - a;
        div  = d / e;
        mod  = d % e;
        pow  = d ** e;

        #10;

        $finish;
    end

endmodule



// ============================================================
// Unary Operators
// ============================================================

module unary_ops;

    integer a, b, c;

    initial begin

        a = -4;      // unary minus
        b = +5;      // unary plus
        c = -10 / 5; // unary with division

        $monitor("Time=%0t : a=%0d b=%0d c=%0d", $time, a, b, c);

    end

endmodule



// ============================================================
// Logical Operators
// ============================================================

module logical_ops;

    reg [3:0] A, B;

    wire notA;
    wire notA_alt;
    wire andAB;
    wire orAB;
    wire eql_AB;

    assign notA     = ~A;      // bitwise NOT
    assign notA_alt = !A;      // logical NOT
    assign andAB    = A && B;  // logical AND
    assign orAB     = A || B;  // logical OR
    assign eql_AB   = (A == B);// logical equality

    initial begin

        $monitor("Time=%0t A=%b B=%b | ~A=%b !A=%b | AND=%b OR=%b EQ=%b",
                 $time, A, B, notA, notA_alt, andAB, orAB, eql_AB);

        A = 0; B = 0; #10;
        A = 0; B = 5; #10;
        A = 5; B = 0; #10;
        A = 5; B = 5; #10;

        A = 2'b0x; B = 2'b10; #10;
        A = 2'b0x; B = 2'b00; #10;
        A = 2'b0x; B = 2'b0x; #10;
        A = 2'b0z; B = 2'b0z; #10;

    end

endmodule



// ============================================================
// Relational Operators
// ============================================================

module relational_ops(

    input wire [3:0] A,
    input wire [3:0] B,
    input wire [3:0] X,
    input wire [3:0] Y,

    output wire A_leq_B,
    output wire A_gt_B,
    output wire Y_geq_X,
    output wire Y_lt_X

);

    assign A_leq_B = (A <= B);
    assign A_gt_B  = (A > B);
    assign Y_geq_X = (Y >= X);
    assign Y_lt_X  = (Y < X);

endmodule



// ============================================================
// Equality Operators
// ============================================================

module case_eq(

    output logic_eq,
    output case_eq,
    output nlogic_eq,
    output ncase_eq,

    input [3:0] A,
    input [3:0] B

);

    assign logic_eq  = (A == B);   // logical equality
    assign case_eq   = (A === B);  // case equality
    assign nlogic_eq = (A != B);   // logical inequality
    assign ncase_eq  = (A !== B);  // case inequality

endmodule



// ============================================================
// Bitwise Operators
// ============================================================

module bitwise_ops(

    input wire [3:0] X,
    input wire [3:0] Y,

    output wire [3:0] notX,
    output wire [3:0] andXY,
    output wire [3:0] orXY,
    output wire [3:0] xorXY,
    output wire [3:0] xnorXY

);

    assign notX  = ~X;
    assign andXY = X & Y;
    assign orXY  = X | Y;
    assign xorXY = X ^ Y;
    assign xnorXY = X ^~ Y;

endmodule



// ============================================================
// Reduction Operators
// ============================================================

module reduction_ops(

    input wire [3:0] X,

    output wire and_result,
    output wire or_result,
    output wire xor_result

);

    assign and_result = &X;
    assign or_result  = |X;
    assign xor_result = ^X;

endmodule



// ============================================================
// Shift Operators
// ============================================================

module shifting_ops(

    input wire [3:0] X,

    output wire [3:0] y_logical_right,
    output wire [3:0] y_logical_left_1,
    output wire [3:0] y_logical_left_2

);

    assign y_logical_right = X >> 1;
    assign y_logical_left_1 = X << 1;
    assign y_logical_left_2 = X << 2;

endmodule



// ============================================================
// Arithmetic Shift Example
// ============================================================

module arithmetic_shift;

    integer a, b, c, i;

    initial begin

        a = 0;  b = 10;  #10;
        a = 5;  b = -20; #10;
        a = -10; b = 15; #10;
        a = 8;  b = -8;  #10;
        a = 0;  b = 0;   #10;

    end

    initial begin

        for(i = 0; i < 5; i = i + 1) begin

            c = a + (b >>> 3);

            $display("Time=%0t a=%0d b=%0d b>>>3=%0d c=%0d",
                     $time, a, b, b >>> 3, c);

            #10;

        end

    end

endmodule



// ============================================================
// Tri-state Buffer Example
// ============================================================

module tristate_buffer(

    input wire drive_enable,
    input wire [35:0] addr_out,
    output wire [35:0] addr_bus

);

    assign addr_bus = drive_enable ? addr_out : 36'bz;

endmodule