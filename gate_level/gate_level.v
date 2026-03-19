

 module gate_instantiations;

 wire OUT1,OUT2,OUT3, IN1, IN2, IN3;
 assign IN1 = 1; //Play around with the values
 assign IN2 = 0;
 assign IN3 = 1;

 // Two-input gates
 and and1(OUT1, IN1, IN2); // AND Gate
 nand nand1(OUT2, IN1, IN2); // NAND Gate
 // More than two inputs
 nand nand3(OUT3, IN1, IN2, IN3); // 3-input NAND Gate
 initial #5 $display("Out1 : %0b, Out2 : %0b,Out3 : %0b",OUT1,OUT2,OUT3);
 initial #30 $finish;
 endmodule

 module buf_not_gate_instantiations;

 wire OUT1, OUT2,OUT3,OUT4, IN;
assign IN = 1'b0; //Play around with the values

// Single-output gates
 buf buf1(OUT1, IN); // Buffer
 not not1(OUT2, IN); // Inverter

// Multiple-output buffer
 buf buf2(OUT3, OUT4, IN);



initial #5 $display("Out1 : %0b, Out2 : %0b,Out3 : %0b,Out4 : %0b",OUT1,OUT2,OUT3,OUT4);
 initial #30 $finish;

endmodule

 module conditional_buf;

 wire OUT1,OUT2, IN, CTRL;
 assign IN = 1; //Play around with the values
 assign CTRL = 0;
 // Conditional buffer
 bufif1 buf1(OUT1, IN, CTRL); // Propagates input only if CTRL is 1
 notif0 not1(OUT2, IN, CTRL); // Produces inverted output if CTRL is 0
 initial #5 $display("Out1 : %0b, Out2 : %0b",OUT1,OUT2);
 initial #30 $finish;

 endmodule

module array_of_gate_instances;

 wire [7:0] OUT1,OUT2, IN1, IN2;

 assign IN1 = 8'd3;
 assign IN2 = 8'd2;

 initial #1 $display("IN1 : %0b, IN2 : %0b",IN1,IN2);

 // Array of NAND gates
 nand n_gate[7:0](OUT1, IN1, IN2);

 // Equivalent to:
 nand n_gate0(OUT2[0], IN1[0], IN2[0]);
 nand n_gate1(OUT2[1], IN1[1], IN2[1]);

 nand n_gate2(OUT2[2], IN1[2], IN2[2]);
 nand n_gate3(OUT2[3], IN1[3], IN2[3]);
 nand n_gate4(OUT2[4], IN1[4], IN2[4]);
 nand n_gate5(OUT2[5], IN1[5], IN2[5]);
 nand n_gate6(OUT2[6], IN1[6], IN2[6]);
 nand n_gate7(OUT2[7], IN1[7], IN2[7]);

 initial #5 $display("Out1 : %0b, Out2 : %0b",OUT1,OUT2);
 initial #30 $finish;

 endmodule
