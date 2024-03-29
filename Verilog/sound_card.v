`include "input_controls.v"
//`include "square_wave.v"
// `include "sawtooth_wave.v"
// `include "adder.v"
`include "noise_wave.v"
`include "shifter.v"
/*
The top level module, the sound card. Consists of four channels switched on and off
at different frequencies by the input controls. Channel outputs are combined and
output.
*/
module sound_card(
  output [7:0] combined,
  input clk
);
  wire [11:0] freq1, freq2, freq3, freq4;
  wire [7:0] ch1_out, ch2_out, ch3_out, ch4_out;
  wire noise_freq_ctrl;
  //First, the input controls
  controls in_ctrls(.freq1(freq1),.freq2(freq2),.freq3(freq3),.freq4(freq4), .clk(clk));

  //Inputs send instructions to each channel
  square_wave #(8, 12, 8'b10000000) ch1(.square_out(ch1_out),.clk(clk),.frequency_control(freq1));
  square_wave #(8, 12, 8'b10000000) ch2(.square_out(ch2_out),.clk(clk),.frequency_control(freq2));
  sawtooth_wave #(12) ch3(.sawtooth_out(ch3_out),.clk(clk),.frequency_control(freq3));

  square_wave #(1, 12)noise_pulse(.square_out(noise_freq_ctrl),.clk(clk),.frequency_control(freq4));
  noise_wave ch4(.noise_out(ch4_out),.clk(noise_freq_ctrl));

  wire [7:0] combined;
  //Currently, this divides both channels by 2 and adds them, which should give roughly the right thing
  shifter combine(.sound_out(combined),.Chl1(ch1_out),.Chl2(ch2_out),.Chl3(ch3_out),.Chl4(ch4_out),.freq1(freq1),.freq2(freq2),.freq3(freq3),.freq4(freq4));

  endmodule
