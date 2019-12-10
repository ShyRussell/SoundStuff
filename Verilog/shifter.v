// Sabrina Pereira, Shy Russell, Jonah Spicher
/*-----------------------------------------------------------------------------
Shifter, Normalizer and Adder
Bit shifts the input channel waves and adds them in order to produce an
output 8-bit wave.
-----------------------------------------------------------------------------*/

module shifter
(
  output[7:0] sound_out,
  input[7:0] Chl1,
  input[7:0] Chl2,
  input[7:0] Chl3,
  input[7:0] Chl4,
  input [11:0] freq1,
  input [11:0] freq2,
  input [11:0] freq3,
  input [11:0] freq4
  );

reg [7:0] Chl1_norm, Chl2_norm, Chl3_norm, Chl4_norm;
always@(*) begin
  if (freq1 === 0) begin
    Chl1_norm = 0;
  end
  else begin
    Chl1_norm = Chl1;
  end
  if (freq2 === 0) begin
    Chl2_norm = 0;
  end
  else begin
    Chl2_norm = Chl2;
  end
  if (freq3 === 0) begin
    Chl3_norm = 0;
  end
  else begin
    Chl3_norm = Chl3;
  end
  if (freq4 === 0) begin
    Chl4_norm = 0;
  end
  else begin
    Chl4_norm = Chl4;
  end

end

assign sound_out = ($signed(Chl1_norm)>>>2) + ($signed(Chl2_norm)>>>2) + ($signed(Chl3_norm)>>>2) + ($signed(Chl4_norm)>>>2);

endmodule
