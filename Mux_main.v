module mux(a,b,s,out);
input a,b,s;
output out;
assign out=s?b:a;
endmodule
