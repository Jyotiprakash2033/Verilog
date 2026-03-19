`timescale 1ns/1ns
`include "operators.v"

//TODO iverilog -s operators_tb -o operators.vvp operators_tb.v

module operators_tb;


// ==================================================
// tb_arithmetic_operations
// ==================================================

// arithmetic_operations uut_arithmetic();


// ==================================================
// tb_unary_ops
// ==================================================

unary_ops uut_unary();


// ==================================================
// tb_logical_ops
// ==================================================

// logical_ops uut_logical();



// ==================================================
// tb_relational_ops
// ==================================================

// reg [3:0] A_rel, B_rel, X_rel, Y_rel;
// wire A_leq_B, A_gt_B, Y_geq_X, Y_lt_X;

// relational_ops uut_relational (
//     .A(A_rel),
//     .B(B_rel),
//     .X(X_rel),
//     .Y(Y_rel),
//     .A_leq_B(A_leq_B),
//     .A_gt_B(A_gt_B),
//     .Y_geq_X(Y_geq_X),
//     .Y_lt_X(Y_lt_X)
// );

// initial begin
//     $monitor("Time=%0t | A=%0d B=%0d X=%b Y=%b | A<=B=%b A>B=%b Y>=X=%b Y<X=%b",
//              $time, A_rel, B_rel, X_rel, Y_rel, A_leq_B, A_gt_B, Y_geq_X, Y_lt_X);

//     A_rel = 4; B_rel = 3; X_rel = 4'b1010; Y_rel = 4'b1101; #10;
//     A_rel = 2; B_rel = 5; X_rel = 4'b1110; Y_rel = 4'b1001; #10;
//     A_rel = 6; B_rel = 6; X_rel = 4'b0001; Y_rel = 4'b0100; #10;
//     A_rel = 4'b1x01; B_rel = 4'b1010; X_rel = 4'b0z01; Y_rel = 4'b0100; #10;
// end



// ==================================================
// tb_case_eq
// ==================================================

// reg [3:0] A_eq, B_eq;
// wire logic_eq, case_eq_w, nlogic_eq, ncase_eq;

// case_eq uut_case (
//     .A(A_eq),
//     .B(B_eq),
//     .logic_eq(logic_eq),
//     .case_eq(case_eq_w),
//     .nlogic_eq(nlogic_eq),
//     .ncase_eq(ncase_eq)
// );

// initial begin
//     $monitor("Time=%0t A=%b B=%b | Logical EQ=%b Case EQ=%b | Logical NEQ=%b Case NEQ=%b",
//              $time, A_eq, B_eq, logic_eq, case_eq_w, nlogic_eq, ncase_eq);

//     A_eq = 4'b1010; B_eq = 4'b1010; #10;
//     A_eq = 4'b1x10; B_eq = 4'b1010; #10;
//     A_eq = 4'b1x10; B_eq = 4'b1x10; #10;
// end



// ==================================================
// tb_bitwise_ops
// ==================================================

// reg [3:0] X_bit, Y_bit;
// wire [3:0] notX, andXY, orXY, xorXY, xnorXY;

// bitwise_ops uut_bitwise (
//     .X(X_bit),
//     .Y(Y_bit),
//     .notX(notX),
//     .andXY(andXY),
//     .orXY(orXY),
//     .xorXY(xorXY),
//     .xnorXY(xnorXY)
// );

// initial begin
//     $monitor("Time=%t X=%b Y=%b | ~X=%b X&Y=%b X|Y=%b X^Y=%b X^~Y=%b",
//              $time, X_bit, Y_bit, notX, andXY, orXY, xorXY, xnorXY);

//     X_bit = 4'b1010; Y_bit = 4'b1100; #10;
//     X_bit = 4'b0101; Y_bit = 4'b0011; #10;
// end



// ==================================================
// tb_reduction_ops
// ==================================================

// reg [3:0] X_red;
// wire and_result, or_result, xor_result;

// reduction_ops uut_reduction (
//     .X(X_red),
//     .and_result(and_result),
//     .or_result(or_result),
//     .xor_result(xor_result)
// );

// initial begin
//     $monitor("Time=%0t | X=%b | Reduction AND=%b | Reduction OR=%b | Reduction XOR=%b",
//              $time, X_red, and_result, or_result, xor_result);

//     X_red = 4'b1010; #10;
//     X_red = 4'b1111; #10;
//     X_red = 4'b0000; #10;
//     X_red = 4'b1001; #10;
//     X_red = 4'b0101; #10;
// end



// ==================================================
// tb_shifting_ops
// ==================================================

// reg [3:0] X_shift;
// wire [3:0] y_logical_right, y_logical_left_1, y_logical_left_2;

// shifting_ops uut_shift (
//     .X(X_shift),
//     .y_logical_right(y_logical_right),
//     .y_logical_left_1(y_logical_left_1),
//     .y_logical_left_2(y_logical_left_2)
// );

// initial begin
//     $monitor("Time=%0t | X=%b (%0d) | >>1=%b <<1=%b <<2=%b",
//              $time, X_shift, X_shift, y_logical_right, y_logical_left_1, y_logical_left_2);

//     X_shift = 4'b1100; #10;
//     X_shift = 4'b0110; #10;
//     X_shift = 4'b1001; #10;
//     X_shift = 4'b0000; #10;
//     X_shift = -2; #10;
// end



// ==================================================
// tb_arithmetic_shift
// ==================================================

// arithmetic_shift uut_arith_shift();



// ==================================================
// tb_tristate_buffer
// ==================================================

// reg drive_enable;
// reg [35:0] addr_out;
// wire [35:0] addr_bus;

// tristate_buffer uut_tristate (
//     .drive_enable(drive_enable),
//     .addr_out(addr_out),
//     .addr_bus(addr_bus)
// );

// initial begin
//     $monitor("Time=%t | drive_enable=%b addr_out=%h addr_bus=%h",
//              $time, drive_enable, addr_out, addr_bus);

//     addr_out = 36'h123456789; drive_enable = 1; #10;
//     addr_out = 36'hABCDEFFF0; drive_enable = 0; #10;
// end



// ==================================================
// VCD Dump
// ==================================================

initial begin
    $dumpfile("operators.vcd");
    $dumpvars(0, operators_tb);
end


endmodule