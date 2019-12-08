module shifter
(
  output[7:0] sound_out,
  // input clk,
  input[7:0] Chl1,
  input[7:0] Chl2,
  input[7:0] Chl3,
  input[7:0] Chl4
  );

assign sound_out = (Chl1>>>2) + (Chl2>>>2) + (Chl3>>>2) + (Chl4>>>2);

endmodule
