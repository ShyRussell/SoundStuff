// Sabrina Pereira, Shy Russell, Jonah Spicher
/*-----------------------------------------------------------------------------
Noise Wave Generator
-----------------------------------------------------------------------------*/

module noise_wave
// #(parameter sqwave_noise_outer_width = 8)
(
    output reg [7:0] noise_out,
    input  clk   // System clock
    // input  [sqwave_noise_outer_width-1:0] frequency_control  // How many clock cycles for period, must be multiple of 32 clock cycles

);
reg [7:0] noise1;
reg [7:0] noise2;
// reg [7:0] noise3;
// reg [7:0] noise4;

initial noise1 = 8'b10101010;
initial noise2 = 8'b01010101;
// initial noise3 = 8'b11110000;
initial noise_out = 8'b0;


always @(posedge clk) begin
  noise1 <= noise1 >>1;
  noise2 <= noise2 >>1;
  // noise3 <= noise3 >>1;
  // noise3[7] <= noise3[2]^noise2[6];
  noise2[7] <= noise2[5]^noise1[4];
  noise1[7] <= noise1[0]^noise2[1];
  noise_out <= {noise2[0], noise1[5], noise2[4], noise2[2], noise1[1], noise2[6], noise1[6], noise1[0]};

end

endmodule
