
// ============================================================================
//  1. FULL ADDER
// ============================================================================
module full_adder(input A, B, Cin, output S, Cout);
    assign S    = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));
endmodule

// ============================================================================
//  2. FULL ADDER/SUBTRACTOR (M=0 add, M=1 subtract)
// ============================================================================
module adder_subtractor(input [3:0] A, B, input M,
                        output [3:0] S, output Cout, V);
    wire [3:0] B_xor;
    wire c1, c2, c3, c4;

    // XOR each B bit with M (invert B when M=1)
    assign B_xor = B ^ {4{M}};

    full_adder FA0(A[0], B_xor[0], M,  S[0], c1);
    full_adder FA1(A[1], B_xor[1], c1, S[1], c2);
    full_adder FA2(A[2], B_xor[2], c2, S[2], c3);
    full_adder FA3(A[3], B_xor[3], c3, S[3], c4);

    assign Cout = c4;
    assign V    = c4 ^ c3;  // signed overflow detection
endmodule

// ============================================================================
//  3. TESTBENCH
// ============================================================================
module tb;
    reg  [3:0] A, B;
    reg        M;
    wire [3:0] S;
    wire       Cout, V;

    adder_subtractor dut(.A(A),.B(B),.M(M),.S(S),.Cout(Cout),.V(V));

    initial begin
        $monitor("M=%b A=%b B=%b | S=%b Cout=%b V=%b", M,A,B,S,Cout,V);

        // --- ADDITION (M=0) ---
        M=0; A=4'd6;  B=4'd3;  #10; // 6+3  = 9  no overflow
        M=0; A=4'd7;  B=4'd8;  #10; // 7+8  = 15 no overflow
        M=0; A=4'd15; B=4'd1;  #10; // unsigned overflow (Cout=1)

        // --- SUBTRACTION (M=1) ---
        M=1; A=4'd9;  B=4'd3;  #10; // 9-3  = 6  (A>B)
        M=1; A=4'd3;  B=4'd9;  #10; // 3-9  negative (A<B)

        // --- SIGNED OVERFLOW (M=0) ---
        M=0; A=4'b0111; B=4'b0001; #10; // +7 + +1 = overflow (V=1)
        M=0; A=4'b1000; B=4'b1111; #10; // -8 + -1 = overflow (V=1)

        $finish;
    end
endmodule