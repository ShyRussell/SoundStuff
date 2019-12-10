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
    switch_ctrls = 4'b0001;
    #10000
    switch_ctrls = 4'b0010;
    #10000
    switch_ctrls = 4'b0100;
    #10000
    switch_ctrls = 4'b1000;
    #10000
    switch_ctrls = 4'b0000;
    #10000
    switch_ctrls = 4'b1010;
    #10000
    switch_ctrls = 4'b0101;
    
    $finish();
  end

endmodule
