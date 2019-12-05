`include "sawtooth_wave.v"
`include "sawtooth_LUT.v"
`include "square_wave.v"
module shifter
(
  output[7:0] square_shift;
  input[7:0] square_out;
  );

  always @(posedge clk) begin
    square_out = square_out<<2;
endmodule
