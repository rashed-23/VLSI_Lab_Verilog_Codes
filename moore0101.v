module moore0101(clock,reset,in,out);
input clock,reset,in;
output reg out;
parameter [2:0] s1=3'b000, s2=3'b001, s3=3'b010,s4=3'b011,s5=3'b100;

reg [2:0] y,Y;

always @(y or in)
begin

begin // Next State Logic
case (y)
s1: if(in) Y=s1; else Y=s2;
s2: if(in) Y=s3; else Y=s1;
s3: if(in) Y=s1; else Y=s4;
s4: if(in) Y=s5; else Y=s2;
s5: if(in) Y=s1; else Y=s4;
default Y=3'bxxx;
endcase
end

begin // Output logic
if(y==s5)
out=1;
else out=0;
end

end

// State Update

always @(posedge clock or negedge reset)
begin
if(reset)
y<=s1;
else y<=Y;
end

endmodule





