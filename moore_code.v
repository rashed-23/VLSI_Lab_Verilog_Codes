module moore(clk, resetn, w, z);
  input clk, resetn, w;
  output reg z;

  reg [1:0] y, Y;

  parameter [1:0] A = 2'b00,
                  B = 2'b01,
                  C = 2'b10;

  // Next state logic
  always @(w or y) begin begin
    case (y)
      A: if (w) Y = B; else Y = A;
      B: if (w) Y = C; else Y = A;
      C: if (w) Y = C; else Y = A;
      default: Y=2'bxx;
    endcase
  end
  // Output logic (Moore: depends only on state)
 begin
    if (y == C)
      z = 1;
    else
      z = 0;
  end
end

  // State update
  always @(posedge clk or negedge resetn) begin
    if (resetn)    // Active-LOW async reset
      y <= A;
    else
      y <= Y;
  end
endmodule

