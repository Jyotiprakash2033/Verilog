module my_and(output y, input a,b);
wire nand_out;
nand(nand_out,a,b);
nand(y,nand_out,nand_out);
endmodule


module my_or(output y,input a,b);
wire nand_out1,nand_out2;
nand(nand_out1,a,a);
nand(nand_out2,b,b);
nand(y,nand_out1,nand_out2);
endmodule


module my_not(output y,input a);
nand(y,a,a);
endmodule