
`timescale 1ns/1ps

module tb_melay0101;

  // Inputs to DUT
  reg clock;
  reg reset;
  reg in;

  // Output from DUT
  wire out;

  // Instantiate the design under test (DUT)
  Melay_0101 dut (
    .clock(clock),
    .reset(reset),
    .in(in),
    .out(out)
  );

  // Clock generation: 10ns period
  always #5 clock = ~clock;

  // Stimulus
  initial begin
    // Initialize signals
    clock = 0;
    reset = 0;
    in = 0;

    // Apply reset
    $display("Applying reset...");
    #5 reset = 1;
    #10 reset = 0; // release reset

    // Apply input sequence
    $display("Starting input sequence...");

    // Example sequence with 0101 pattern inside
    #10 in = 0;  // bit1
    #10 in = 1;  // bit2
    #10 in = 0;  // bit3
    #10 in = 1;  // bit4 -> should detect "0101"
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;  
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;

    // End simulation
    #50 $finish;
  end

  // Monitor output
  initial begin
    $monitor("Time=%0t | reset=%b | in=%b | out=%b | state(y)=%b | next(Y)=%b",
              $time, reset, in, out, dut.y, dut.Y);
  end

endmodule
