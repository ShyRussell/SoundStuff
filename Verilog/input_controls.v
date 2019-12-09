`include "sawtooth_wave.v"

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

initial begin
freq1 = 0;
freq2 = 0;
freq3 = 0;
freq4 = 0;
end

  reg reset1, reset2, reset3, reset4;
  reg [7:0] len1, len2, len3, len4;
  wire [7:0] len_counter1, len_counter2, len_counter3, len_counter4;
  counter len1_count(.count(len_counter1),.clk(clk),.reset(reset1));
  counter len2_count(.count(len_counter2),.clk(clk),.reset(reset2));
  counter len3_count(.count(len_counter3),.clk(clk),.reset(reset3));
  counter len4_count(.count(len_counter4),.clk(clk),.reset(reset4));

  always @(*) begin
  // Control counter reset and frequencies
    if (len_counter1 === len1) begin
      reset1 = 1;
      freq1 = 8'd0;
    end
    else begin
      reset1 = 0;
    end
    if (len_counter2 === len2) begin
      reset2 = 1;
      freq2 = 8'd0;
    end
    else begin
      reset2 = 0;
    end
    if (len_counter3 === len3) begin
      reset3 = 1;
      freq3 = 8'd0;
    end
    else begin
      reset3 = 0;
    end
    if (len_counter4 === len4) begin
      reset4 = 1;
      freq4 = 8'd0;
    end
    else begin
      reset4 = 0;
    end
  end



  always @(switch) begin
  reset1 = 1;
  reset2 = 1;
  reset3 = 1;
  reset4 = 1;
  if (switch[0]) begin
    freq1 = 8'd4;
    len1 = -8'd1;
  end
  else if (switch[1]) begin
    freq2 = 8'd40;
    len2 = -8'd1;
  end
  else if (switch[2]) begin
    freq3 = 8'd10;
    len3 = -8'd1;
  end
  else if (switch[3]) begin
  freq4 = 8'd10;
  len4 = -8'd1;
  end
  else begin

  end
  end
endmodule
