module nor_latch_bh(q,qbar,s,r);
output reg q;
output qbar;
input s,r;

assign qbar = ~q;

always @(*) 
begin
    case({s,r})

    2'b11: q=1'bx;
    2'b10: q=1;
    2'b01: q=0;
    endcase 
        
    
end
endmodule