module my_reset(reset);
output reset;
reg c=1'b0;
    initial begin
        #20
    c =1'b1;
    #5
    c=1'b0;
    #40
    c =1'b1;
    #5
    c=1'b0;
end

assign reset = c ;
endmodule