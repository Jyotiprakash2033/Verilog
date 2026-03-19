`timescale 1ns/1ns

module not_bh(out,in);
output reg out;
input in;

always @(in)
begin
    out = ~in ; 
    
end
  
endmodule

module notif0_bh(out,in,enable);
output reg out;
input in;
input enable;

always @(*) 
begin
    if(!enable)
    out = ~in;
    else
    out = 1'bz;

end

 
endmodule


// testbench

module notif0_tb( );
wire out;
reg in;
reg enable;

notif0_bh mut(out ,in, enable);
initial begin
    $display("not demonstration");
    $monitor("$time:%0t: | enable: %0b | in:%0b |out:%0b  ",$time,enable,in,out);
   
   #5
   enable = 1; in = 0 ;
   #5
   enable =1; in = 1;
   #5
   enable = 0; in =1;
   #2
   enable = 0; in =0;
   #5
   $finish;

end
initial begin
    $dumpfile("notif0.vcd");
    $dumpvars(0,notif0_tb);
end

endmodule

