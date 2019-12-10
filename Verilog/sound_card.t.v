`include "sound_card.v"
module sound_card_test();
  reg clk;
  reg [3:0] switch_ctrls;
  wire [7:0] sound;
  sound_card chip(.combined(sound),.switches(switch_ctrls),.clk(clk));

  initial clk = 0;
  always #10 clk = !clk;
  initial begin
    $dumpfile("soundcard.vcd");
    $dumpvars();
    $readmemh("notes.dat", chip.in_ctrls.music_storage.mem);
    #10000000
    $finish();
  end

endmodule
