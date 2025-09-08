`timescale 1ns/1ps
module and_tb;
reg a,b;
wire out;
and_gate DUT(.a(a), .b(b), .out(out));
initial 
begin
$monitor($time," a = %b, b = %b, out = %b",a,b,out);
#0
a=0;b=0;
#5
b=1;
#5
a=1;b=0;
#5
b=1;
#5
$finish;
end
endmodule
