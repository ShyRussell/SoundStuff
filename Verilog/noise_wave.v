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

initial noise_out =8'b10101010;

always @(posedge clk) begin
  noise_out <= noise_out >>1;
  noise_out[7] <= noise_out[1]^noise_out[0];
end

endmodule
