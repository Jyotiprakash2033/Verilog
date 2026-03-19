`timescale 1ns/1ns

module initial_demo;

reg a;
reg b;

reg [7:0] data;

integer i;


// ---------- Initialize values ----------

initial begin

a = 0;
b = 0;
data = 0;

end



// ---------- Stimulus ----------

initial begin

$display("Simulation started");

#10 a = 1;
#10 b = 1;
#10 a = 0;

end



// ---------- Loop Example ----------

initial begin

for(i = 0; i < 5; i = i + 1) begin

    #5 data = data + 1;
end

end



// ---------- Monitor ----------

initial begin

$monitor("time=%0t a=%b b=%b data=%d",$time,a,b,data);

end



// ---------- Finish Simulation ----------

initial begin

#50
$display("Simulation finished");
$finish;

end


endmodule