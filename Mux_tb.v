`timescale 1ns/1ps
module mux_tb;
reg a,b,s;
wire out;
mux mux_test(.a(a),.b(b),.s(s),.out(out));
initial begin
$monitor("a = %b, b = %b, c = %b, out = %b",a,b,s,out);
a=0;
b=0;
s=0;
#5
a=0;
b=1;
s=0;
#5
a=0;
b=1;
s=1;
#5
$finish;
end
endmodule

