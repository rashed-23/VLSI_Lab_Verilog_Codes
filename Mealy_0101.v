module Melay_0101(clock,reset,in,out);
input clock,reset,in;
output reg out;
parameter [1:0] A=2'b00, B=2'b01, C=2'b10, D=2'b11;
reg [1:0] y,Y;

always@(y or  in)
begin // Next state and output logic;

begin // Next State Logic
case(y)
A: if(in)Y<=A; else Y<=B;
B: if(in)Y<=C; else Y<=B;
C: if(in)Y<=A; else Y<=D;
D: if(in)Y<=C; else Y<=B;
default Y=2'bxx;
endcase
end
begin // Output Logic
out=(y==D)&in;
end
end

always@(posedge clock or negedge reset)
begin
if(reset)
y<=A;
else
y<=Y;
end

endmodule



