`include "counter.v"

module controls(
  output reg [7:0] freq1, //Actually equal to 1/2 a period in clock cycles
  output reg [7:0] freq2,
  output reg [7:0] freq3,
  output reg [7:0] freq4,
  input [3:0] switch, //There are four switches on the FPGA
  input clk
);
//todo:
// add length and counters
// Change to output zero when off
// Make shifting adapt to frequencies
// Write pre written songs

wire reset1, reset2, reset3, reset4;
wire [7:0] len_counter1, len_counter2, len_counter3, len_counter4;
counter len1_count(.count(len_counter1),.clk(clk),.reset(reset1));
counter len2_count(.count(len_counter2),.clk(clk),.reset(reset2));
counter len3_count(.count(len_counter3),.clk(clk),.reset(reset3));
counter len4_count(.count(len_counter4),.clk(clk),.reset(reset4));




  always @(switch) begin
  if (switch === 4'd0) begin
    //Do a pre-loaded thing
      freq1 = 8'd20;
      freq2 = 8'd20;
      #200
      freq1 = 8'd5;
      freq2 = 8'd20;
      #60
      freq1 = 8'd1;
      freq2 = 8'd20;
      #40
      freq1 = 8'd24;
      freq2 = 8'd20;
      #20
      freq1 = 8'd20;
      freq2 = 8'd20;
  end
  else begin
    // Otherwise set frequency to the switch's value
    freq1 <= switch;
    freq2 <= switch;
  end
  end
endmodule
