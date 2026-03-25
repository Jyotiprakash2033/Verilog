// //question 1
// module  question_1();
// reg [7:0] a;
// reg b;
// reg signed [3:0] c;
// reg  d;

// initial begin
//     a = 8'b0111_1011;
//     b = 16'hx;
//     c = 4'b1110;
//     d = 'h1234;
//     $display("a = %0d, b = %0H, c in binary %0b,c in decimal : %0d, d = %0h",a,b,c,c,d);
// end
    
// endmodule


// //question 2
// module question_2();
// initial begin
    
// $display("This is a string displaying the % sign") ;//option a is wrong
// $display("This is a string displaying the %% sign") ;//fixing option a 
// $display("out=in1+in2"); //option b is correct
//  $display("Please ring a bell \007 dummy text"); //option b is correct, just ignores whatever is with backslash
//  $display("This is a backslash \ character \n"); //option d is wrong
//  $display("This is a backslash \\ character \n"); //fixing option d

// end
// endmodule


// module question_3;

//  reg system1; // We cannot start with a number except that it is always correct
//  reg 1reg; // cannot start with a number
//  reg $latch; // cannot start with a $ symbol
//  reg exec$; // We cannot start with a $ symbol except that it is always correct


//  endmodule


module question_4();

reg [7:0] a_in; //An 8-bit vector net called a_in.
reg [31:0] address = 32'd3;//A 32-bit storage register called address. Bit 31 must be the most significant bit. 
                            //Set the value of the register to a 32-bit decimal number equal to 3.

integer count; //An integer called count.

time snap_shot; //A time variable called snap_shot.
integer delays[19:0];//An array called delays.
reg [63:0] MEM [255:0];//Array contains 20 elements of the type integer.
parameter cache_size =512 ; //A memory MEM containing 256 words of 64 bits each.
 //A parameter cache_size equal to 512.

endmodule


`define MEM_SIZE 1024

module question_5;

 reg [3:0] latch;
reg [2:0] in_reg;
initial begin
latch = 4'd12;
$display("The current value of latch = %b\n", latch); // Ans : The current value of latch =4’b1100
in_reg=3'd2;
$monitor($time, " In register value = %b\n", in_reg[2:0]); //0 In register value = 3’b010
$display("The maximum memory size is %h", `MEM_SIZE); //The maximum memory size is ‘h400
end
endmodule