module testbench;

reg  [3:0] a;
reg  [3:0] b;
reg  cin;
wire [3:0] sum;
wire cout;

bcd_adder DUT(
    .A(a),
    .B(b),
    .Cin(cin),
    .S(sum),
    .Cout(cout)
);

reg clk;
reg rst;
reg [3:0] i;

// Initial values
initial begin
    clk = 0;
    rst = 1;
    a   = 4'b0000;
    b   = 4'b0000;
    cin = 1'b0;
    #20;
    rst = 0;
end

// Clock generator
always #10 clk = ~clk;

// Test sequence
always @(posedge clk or posedge rst) begin
    if (rst) begin
        i <= 0;
    end
    else begin
        a   <= $urandom % 10;
        b   <= $urandom % 10;
        cin <= $urandom % 2;
        i   <= i + 1;

        if (i == 10)
            $finish;
    end
end

initial begin
    $monitor("%0t: a = %b, b = %b, cin = %b, sum = %b, cout = %b",
              $time, a, b, cin, sum, cout);
end

endmodule