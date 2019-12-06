`include "shifter.v"

module shift_test ();
  wire[7:0] out;
  reg[7:0] Chl1 = 8'd0;
  reg[7:0] Chl2 = 8'd0;
  reg[7:0] Chl3 = 8'd0;
  reg[7:0] Chl4 = 8'b11111111;

  shifter shifter(.sound_out(out), .Chl1(Chl1), .Chl2(Chl2), .Chl3(Chl3), .Chl4(Chl4));
  initial begin
    // Dump waveforms to file
    $dumpfile("shift_test.vcd");
    $dumpvars();
    # 100
    Chl3 = 8'b10101010;
    
    // End execution after some time delay
    #2000 $finish();
  end
endmodule
