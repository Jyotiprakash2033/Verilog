module load_memory;
reg [7:0] membyte[0:255]; // 256 bytes memory
  
initial begin
    
$readmemh("memory_data.txt", membyte); // Load binary data from a file
$display("Memory loaded with data from file.");
$display("membyte[0] = %0h, membyte[1] = %0h, membyte[10] = %0h", membyte[0], membyte[1], membyte[10]);
end
endmodule