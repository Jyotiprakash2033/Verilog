`timescale 1ns/1ns 

// module vector_part_selection ;

// reg [15:0] data ;
// reg [255: 0] data1 ; 
// reg[7:0] byte ; 
// integer j ; 

// initial begin
//     data = 16'hA5C8 ; 
//     $display ("Data = %h" , data) ;

//     $display("MSB = %h" , data[15:8]) ;
//     $display("MSB = %b" , data[15:8]) ;
//     $display("LSB = %h " , data[7:0]) ; 
//     $display("LSB = %b " , data[7:0]) ; 
//     $display("-------------------------") ;
// end

// // The starting bit can also be a variable. The width has
// // to be constant. Therefore, one can use the variable part select
// // in a loop to select all bytes of the vector.

// initial begin
//     #5 
//     data1 = 256'hFFFFFFFFFFFFFFFFFFFFDF0FBFF1F7FF ; 

//     for(j = 0 ; j< 32 ; j = j +1)begin
//         byte = data1[(j*8) +: 8] ;
//         $display ("Byte %0d = %h" , j , byte) ;
//     end
// end

    
// endmodule

// Demonstration of vectors, indexing directions, and variable part-selects

module vector;

reg [15:0] data1;  // Descending index vector → MSB=15, LSB=0
reg [0:15] data2;  // Ascending index vector → MSB=0,  LSB=15

reg [7:0] byte;    // Used to store selected 8-bit portion
integer byteNum;
integer j;

initial begin

    // Assign same value to both vectors
    // 16'h1234 = 0001 0010 0011 0100
    //reg [15:0]  → index decreases left → right
    //reg [0:15]  → index increases left → right

    data1 = 16'h1234;
    $display("data1 : Hex : %x, Binary : %b", data1, data1);

    data2 = 16'h1234;
    $display("data2 : Hex : %x, Binary : %b", data2, data2);

end


initial begin

    // Accessing a single bit
    // Index number is used directly regardless of vector direction

    $display("Bit of Data1 : %b , Bit of Data2 : %b", data1[4], data2[4]);



    // ================================
    // VARIABLE PART SELECT DEMONSTRATION
    // ================================

    /*
    Syntax:

        [start +: width]
        [start -: width]

    Meaning:

        [start +: width]  → select 'width' bits going toward LARGER index
        [start -: width]  → select 'width' bits going toward SMALLER index

    These depend ONLY on index numbers, not MSB/LSB meaning.
    */



    // --------------------------------
    // DATA1 : [15:0] (descending vector)
    // --------------------------------
    //
    // Bit layout:
    //
    // index →   15 ................. 8 7 ................. 0
    // data1 →   [      MSB byte      ] [      LSB byte      ]
    //

    byte = data1[15-:8];  
    // start = 15, width = 8
    // move toward smaller index
    // expands to data1[15:8]
    // This selects the MSB byte

    $display("Data1 MSB : Hex : %x, Binary : %b", byte, byte);


    byte = data1[0+:8];   
    // start = 0, width = 8
    // move toward larger index
    // expands to data1[7:0]
    // This selects the LSB byte

    $display("Data1 LSB : Hex : %x, Binary : %b", byte, byte);



    // --------------------------------
    // DATA2 : [0:15] (ascending vector)
    // --------------------------------
    //
    // Bit layout:
    //
    // index →   0 ................. 7 8 ................. 15
    // data2 →   [      MSB byte      ] [      LSB byte      ]
    //

    byte = data2[15-:8];  
    // start = 15, width = 8
    // move toward smaller index
    // expands to data2[8:15]
    // This selects the LSB byte

    $display("Data2 LSB : Hex : %x, Binary : %b", byte, byte);


    byte = data2[0+:8];   
    // start = 0, width = 8
    // move toward larger index
    // expands to data2[0:7]
    // This selects the MSB byte

    $display("Data2 MSB : Hex : %x, Binary : %b", byte, byte);

end

initial begin

//Can initialize a part of the vector
$display("data1 before Clear MSB: %x", data1);

byteNum = 1;
data1[(byteNum*8)+:8] = 8'b0; //If byteNum = 1, clear 8 bits [15:8]
$display("data1 After Clear MSB: %x", data1);

byteNum = 0;
data1 = 16'h1234;
data1[(byteNum*8)+:8] = 8'b0; //If byteNum = 0, clear 8 bits [0:7]
$display("data1 after Clear LSB: %x", data1);

end

endmodule