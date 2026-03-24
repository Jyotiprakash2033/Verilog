module fullAdder_1bit(sum,c_out,a,b,c_in);

output sum ;
output c_out;
input a,b,c_in;

wire p,g;

assign p = a^b;
assign g = a & b;
assign sum = p ^ c_in;
assign c_out = g | (c_in & p);

    
endmodule

module fullAdder_ripple_4bit(sum,c_out,a,b,c_in);

output [3:0]sum;
output c_out;
input [3:0] a, b;
input c_in;
wire [3:0] p,g;
wire [2:0] c;
assign p = a^b;
assign g = a & b;
assign c[0] = g[0] | (c_in & p[0] );
assign c[1] = g[1] | (c[0] & p[1] );
assign c[2] = g[2] | (c[1] & p[2] );
assign c_out = g[3] | (c[2] & p[3] );

assign sum[0] = p[0] ^ c_in;
assign sum[1] = p[1] ^ c[0];
assign sum[2] = p[2] ^ c[1];
assign sum[3] = p[3] ^ c[2];

endmodule

module fullAdder_lookahead_4bit(sum,c_out,a,b,c_in);

output [3:0]sum;
output c_out;
input [3:0] a, b;
input c_in;
wire [3:0] p,g;
wire [2:0] c;
assign p = a^b;
assign g = a & b;

assign c[0] = g[0] | (c_in & p[0] );
assign c[1] = g[1] | (g[0] | (c_in & p[0] ) & p[1] );
assign c[2] = g[2] | (g[1] | (g[0] | (c_in & p[0] ) & p[1] )& p[2] );
assign c_out = g[3] | (g[2] | (g[1] | (g[0] | (c_in & p[0] ) & p[1] )& p[2] ) & p[3] );

assign sum[0] = p[0] ^ c_in;
assign sum[1] = p[1] ^ c[0];
assign sum[2] = p[2] ^ c[1];
assign sum[3] = p[3] ^ c[2];
// or
//assign sum = p ^ {c[2],c[1],c[0],c_in};

endmodule