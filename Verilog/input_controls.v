module controls(
  input [3:0] switch, //There are four switches on the FPGA
  output reg [7:0] freq1, //Actually equal to 1/2 a period in clock cycles
  output reg [7:0] freq2
  // output reg [7:0] freq3,
  // output reg [7:0] freq4
);
//todo:
//add length and counters
//Change to output zero when off
// Write pre written "songs"
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
