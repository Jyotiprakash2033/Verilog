module arrays_demo;

// ----------------------------------------------------
//? 1️. Simple scalar registers
// ----------------------------------------------------

reg a;
reg b;
wire c;


// ----------------------------------------------------
//? 2️. Vector registers
// ----------------------------------------------------

reg [7:0] byte_data;        // 8-bit register
reg [15:0] word_data;       // 16-bit register


// ----------------------------------------------------
//? 3️. 1D Array (Memory Style Array)
// ----------------------------------------------------

integer count[0:7];        // Array of 8 integer variables
reg boolean[31:0];            // Array of 32 one-bit registers (boolean)
time chk_point[1:100];     // Array of 100 time checkpoint variables

// ----------------------------------------------------
//? 4️. Array of vectors
// ----------------------------------------------------

// 16 locations each storing 8 bits
// very common in register files and memory blocks

reg [7:0] memory [0:15];
reg [15:0] registers [0:3]
wire [7:0] w_array2[5:0];  // Array of 6 nets, each 8 bits wide


// ----------------------------------------------------
//? 5. 2D Array (Multidimensional Array)
// ----------------------------------------------------
// 4 rows × 8 columns

reg matrix [0:3][0:7];
integer matrix[4:0][0:255]; // 2D array of integers (5x256 elements)
reg [63:0] array_4d[15:0][7:0][7:0][255:0]; // 4D array, each element 64 bits wide
wire w_array1[7:0][5:0];    // 2D array of single-bit wires (8x6 elements)





integer i;
integer j;

initial begin

$display("\n==== ARRAY DEMONSTRATION ====\n");

for(i = 0; i < 16; i = i + 1)
begin
    memory[i] = i * 2;
end

$display("Memory Contents:");

for(i = 0; i < 16; i = i + 1)
begin
    $display("memory[%0d] = %0d", i, memory[i]);
end

registers[0] = 16'hAAAA;
registers[1] = 16'hBBBB;
registers[2] = 16'hCCCC;
registers[3] = 16'hDDDD;

$display("\nRegister Array:");

for(i = 0; i < 4; i = i + 1)
begin
    $display("registers[%0d] = %h", i, registers[i]);
end


for(i = 0; i < 4; i = i + 1)
begin
    for(j = 0; j < 8; j = j + 1)
    begin
        matrix[i][j] = i + j;
    end
end


$display("\n2D Matrix Contents:");

for(i = 0; i < 4; i = i + 1)
begin
    for(j = 0; j < 8; j = j + 1)
    begin
        $write("%0d ", matrix[i][j]);
    end
    $display("");
end

// Vector slicing inside arrays

memory[5] = 8'b11010110;

$display("\nVector inside Array Example:");

$display("memory[5] = %b", memory[5]);

$display("Upper nibble = %b", memory[5][7:4]);
$display("Lower nibble = %b", memory[5][3:0]);


$display("\n==== END OF DEMO ====\n");

end

endmodule