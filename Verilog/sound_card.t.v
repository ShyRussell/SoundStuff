`include "sound_card.v"
/*
A simple test for the sound card/the way to run sound card. Instantiates a sound
card, reads a hex music input, then dumps the output to a text file.
*/
module sound_card_test();
  reg clk;
  reg [3:0] switch_ctrls;
  wire [7:0] sound;
  integer f;
  sound_card chip(.combined(sound),.clk(clk));

  initial clk = 0;
  always #10 clk = !clk;

  initial begin
    f = $fopen("sound_out.txt","w"); //The file the wave will be written to
  end

  always @(posedge clk) begin
    $fwrite(f,"%d\n",  $signed(sound));
  end

  initial begin
    $dumpfile("soundcard.vcd");
    $dumpvars();
    $readmemh("notes.dat", chip.in_ctrls.music_storage.mem); //Reads hex input
  end
  always @(*) begin
    if (chip.in_ctrls.music_storage.note === 32'h11000000) begin
      $fclose(f);
      $finish();
    end
  end

endmodule
