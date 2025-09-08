

module blocking_assignment;
  integer a,b;


  initial begin
    $display("-------------------------");

    // Initialize variables
    a = 10;
    b = 15;

    // Show initial values
    $display("\tBefore Assignment :: Value of a is %0d", a);
    $display("\tBefore Assignment :: Value of b is %0d", b);

    // Blocking assignmentsZ
    a = b;   // a takes value of b (15)
    b = 20;  // b is updated to 20

    // Show updated values
    $display("\tAfter  Assignment :: Value of a is %0d", a);
    $display("\tAfter  Assignment :: Value of b is %0d", b);

    $display("--------------------------------");
    $finish;   // End simulation
  end
endmodule
