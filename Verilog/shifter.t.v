`include "shifter.v"

module shift_test ();
  wire[7:0] square_shifted;
  reg clk;
  wire[7:0] square_out;
  reg[7:0] frequency_control;
  wire[7:0] mover;

  // Clock generation
  initial clk=0;
  always #10 clk = !clk;

  initial mover = 2'd0

  square_wave square_wave(.square_out(square_out),.clk(clk),.frequency_control(frequency_control));
  shifter shift_square(.square_out(mover), .square_shift(square_shifted))

  initial begin
    // Dump waveforms to file
    $dumpfile("shift_test.vcd");
    $dumpvars();

    // End execution after some time delay
    #2000 $finish();
  end
