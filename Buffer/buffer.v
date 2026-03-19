`timescale 1ps/1ps

module buffer_df(out,in);
output out;
input in;
assign out = in;
  
endmodule

module bufif1_df(out,in,enable);
output out;
input in;
input enable;

assign out =(enable) ? in :  1'bz;
 
endmodule




module bufif1_tb( );
wire out;
reg in;
reg enable;

bufif1_df mut(out ,in, enable);
initial begin
    $display("buffer demonstration");
    $monitor("$time:%0t: | out:%0b | in:%0b | enable: %0b",$time,out,in,enable);
   
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
    $dumpfile("bufif1.vcd");
    $dumpvars(0,bufif1_tb);
end

endmodule

