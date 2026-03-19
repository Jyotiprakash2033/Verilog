`timescale 1ns/1ns

module signal_strength_demo;

wire w1, w2, w3, w4;

// ---------------- Scenario 1 ----------------
// strong1 vs weak0 → strong wins

assign (strong1, strong0) w1 = 1'b1;
assign (weak1, weak0)     w1 = 1'b0;


// ---------------- Scenario 2 ----------------
// equal strength conflict → x

assign (strong1, strong0) w2 = 1'b1;
assign (strong1, strong0) w2 = 1'b0;


// ---------------- Scenario 3 ----------------
// weak driver only

assign (weak1, weak0) w3 = 1'b1;


// ---------------- Scenario 4 ----------------
// high impedance vs strong

assign (strong1, strong0) w4 = 1'bz;
assign (weak1, weak0)     w4 = 1'b1;



// pull-up example
wire w5;
pullup(w5);


// testbench
initial begin

#1;

$display("---- Signal Strength Demonstration ----\n");

$display("Scenario 1: strong1 vs weak0");
$display("Expected: strong wins → w1 = 1");
$display("w1 = %b\n", w1);


$display("Scenario 2: strong1 vs strong0");
$display("Expected: conflict → x");
$display("w2 = %b\n", w2);


$display("Scenario 3: weak driver only");
$display("Expected: weak1 drives value");
$display("w3 = %b\n", w3);


$display("Scenario 4: strong Z vs weak1");
$display("Expected: weak1 drives bus");
$display("w4 = %b\n", w4);


$display("Scenario 5: pullup primitive");
$display("Expected: weak1 pull-up");
$display("w5 = %b\n", w5);

end

endmodule