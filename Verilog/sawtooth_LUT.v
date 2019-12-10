// Sabrina Pereira, Shy Russell, Jonah Spicher
/*-----------------------------------------------------------------------------
Sawtooth look-up table for values. 
Used for the incremental and linear increase/dropping of the wave's values.
-----------------------------------------------------------------------------*/

module sawtooth_LUT
(
output reg signed[7:0]  sawtooth_out,
input[3:0]       control
);

  always @(*) begin
    case (control)
      0:  begin sawtooth_out = -(8'd128); end
      1:  begin sawtooth_out = -(8'd111); end
      2:  begin sawtooth_out = -(8'd94); end
      3:  begin sawtooth_out = -(8'd77); end
      4:  begin sawtooth_out = -(8'd60); end
      5:  begin sawtooth_out = -(8'd43); end
      6:  begin sawtooth_out = -(8'd26); end
      7:  begin sawtooth_out = -(8'd9); end
      8:  begin sawtooth_out = 8'd8; end
      9:  begin sawtooth_out = 8'd25; end
      10:  begin sawtooth_out = 8'd42; end
      11:  begin sawtooth_out = 8'd59; end
      12:  begin sawtooth_out = 8'd76; end
      13:  begin sawtooth_out = 8'd93; end
      14:  begin sawtooth_out = 8'd110; end
      15:  begin sawtooth_out = 8'd127; end
    endcase
  end
endmodule
