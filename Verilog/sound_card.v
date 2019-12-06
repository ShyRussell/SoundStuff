`include "input_controls.v"
//`include "square_wave.v"
`include "sawtooth_wave.v"
`include "adder.v"

module sound_card(
  input [3:0] switches,
  input clk
);
  wire [7:0] freq1, freq2, ch1_out, ch2_out;
  //First, the input controls
  controls in_ctrls(.switch(switches),.freq1(freq1),.freq2(freq2));

  //Inputs send instructions to each channel
  square_wave ch1(.square_out(ch1_out),.clk(clk),.frequency_control(freq1));
  sawtooth_wave ch2(.sawtooth_out(ch2_out),.clk(clk),.frequency_control(freq2));

  wire [7:0] combined;
  wire c_out;
  //Currently, this divides both channels by 2 and adds them, which should give roughly the right thing
  FullAdder8bit combine(.sum(combined),.carryout(c_out),.carryin(1'b0),.a(ch1_out>>>1),.b(ch2_out>>>1),.sub(1'b0));

  endmodule
