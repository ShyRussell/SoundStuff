`include "sound_card.v"
module sound_card_test();
  reg clk;
  reg [3:0] switch_ctrls;
  wire [7:0] sound;
  integer f;
  sound_card chip(.combined(sound),.clk(clk));

  initial clk = 0;
  always #10 clk = !clk;

  initial begin
    f = $fopen("sound_out.txt","w");
  end

  always @(posedge clk) begin
    $fwrite(f,"%d\n",  $signed(sound));
  end

  initial begin
    $dumpfile("soundcard.vcd");
    $dumpvars();
    $readmemh("notes.dat", chip.in_ctrls.music_storage.mem);
    #10000000
    $fclose(f);
    $finish();
  end

endmodule
