
 //Question 1
 // Find the values of a and b from the given expressions:
// a = y >> 1'b1 and b = y >>> 1'b1.
 // Given that the initial value of y is 1101.

 module question1;
reg signed[3:0] a,b,y; 
 initial begin

 y = 4'b1101;
 a = y >> 1'b1; // Logical right shift
 b = y >>> 1'b1; // Arithmetic right shift, Changes only when applied against signed integers
 $display("In Binary : y = %b, a = %b (>>), b = %b (>>>)", y, a, b);
 $display("In decimal : y = %0d, a = %0d (>>), b = %0d (>>>)", y, a, b);
 end
 endmodule


 //Question 2
 // If p is a 10-bit vector, find its value for the expression:
 // p = {2'bx1, 3'b101, 2'b10, 2{1'b1}}

 module question2;
 reg [9:0] p;
 initial begin
 
 p = {2'bx1, 3'b101, 2'b10, {2{1'b1}}}; // Concatenate and replicate
 #5; // Wait for evaluation
 $display("Value of p = %b", p);
 $finish;
 end
endmodule



 //Question 3
// Find the value of q for the following snippet:
// Given m = 2'b10 and n = 2'b1x,
 // assign q = (m < n) ? 2'b10 : 2'b11.

 module question3;
 reg [1:0] q;
 reg [1:0] m, n;
 initial begin 
 m = 2'b10;
 n = 2'b1x;//n has an unknown bit, so the comparison will yield an unknown result, which will affect the value of q.so q is also ambiquitous
 
 q = (m < n) ? 2'b10 : 2'b01; // Conditional operator, Play around with these, The bits which are same(in the same position) in 
both true and false condition will be show else 'x'
 #5; // Wait for evaluation
 $display("m = %b, n = %b, q = %b", m, n, q);
 $finish;
 end
 endmodule

// // Question 4
//  // Evaluate the following when m = 5'b10x1z and n = 5'b10x1z:
//  // m == n
//  // m === n

//  module question4;

//  reg eq1, eq2;
//  reg [4:0] m, n;

//  initial begin
//  m = 5'b10x1z;
//  n = 5'b10x1z;
//  eq1 = (m == n); // Equality operator
//  eq2 = (m === n); // Case equality operator
//  #5; // Wait for evaluation
//  $display("m = %b, n = %b, m == n: %b, m === n: %b", m, n, eq1, eq2);

// $finish;
//  end
//  endmodule
//  // Question 5

//  // Given a = 4'b0101 and y = 4'b1100, find the value of q for q = a | y.

//  module question5;
//  reg [3:0] q;
//  reg [3:0] a, y;
//  initial begin
// a = 4'b0101;
//  y = 4'b1100;
//  q = a | y; // Bitwise OR
//  #5; // Wait for evaluation
//  $display("a = %b, y = %b, q = %b", a, y, q);
//  $finish;
//  end
//  endmodule

//  // Question 6

//  // Evaluate the values of c and f in the following snippet:

// module question6;
//  reg [3:0] a, b,c;
//  integer d, e,f;
//  initial begin
//  a = 4'b0011; b = 4'b0001;
//  d = 7; e = 3;
//  c = a + b; // 4-bit addition
//  f = d / e; // Integer division
//  #5; // Wait for evaluation
//  $display("a = %b, b = %b, c = %b, d = %0d, e = %0d, f = %0d", a, b, c, d, e, f);
//  $finish;
//  end

// endmodule
