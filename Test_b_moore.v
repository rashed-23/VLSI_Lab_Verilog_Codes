`timescale 1ns/1ps 

module moore_tb;
  
  reg clk,resetn,w;
  wire z;

  moore DUT(.clk(clk),.resetn(resetn),.w(w),.z(z));

  initial begin
        clk =0;
        forever  #5 clk=~clk;
end
       initial 
       begin  
    	$monitor($time,"Clock=%b,Reset=%b, z=%b, w=%b",clk,resetn,z,w);
    		resetn=1'b1;
                w=0;
                #15 
                resetn=1'b0;

    		#10 w=0;
                #10 w=1;
                #10 w=0;
                #10 w=1;
                #10 w=1;
                #10 w=0;
                #10 w=1;
                #10 w=1;
                #10 w=1;
                #10 w=0;
                #10 w=1;
    $finish;
  end
endmodule
