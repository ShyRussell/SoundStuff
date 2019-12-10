`include "sawtooth_wave.v"
`include "memory.v"

module controls(
  output reg [7:0] freq1, //Actually equal to 1/2 a period in clock cycles
  output reg [7:0] freq2,
  output reg [7:0] freq3,
  output reg [7:0] freq4,
  input clk
);
//todo:
// Make shifting adapt to frequencies
// Write pre written songs
  initial begin
    freq1 = 8'd0;
    freq2 = 8'd0;
    freq3 = 8'd0;
    freq4 = 8'd0;
  end

  wire [31:0] extra_data;
  reg next_note;
  wire note_reset;
  wire [31:0] note, note_addr;

  memory music_storage(.mem_addr({note_addr[29:0], 2'b00}),.note(note),.too_high(note_reset),.data_out(extra_data),.data_in(32'd0),.data_addr(32'd0),.clk(clk),.wr_en(1'b0));
  counter #(32) note_finder(.count(note_addr),.clk(next_note),.reset(note_reset));

  reg reset1, reset2, reset3, reset4;
  wire [7:0] len_counter1, len_counter2, len_counter3, len_counter4;
  counter len1_count(.count(len_counter1),.clk(clk),.reset(reset1));
  counter len2_count(.count(len_counter2),.clk(clk),.reset(reset2));
  counter len3_count(.count(len_counter3),.clk(clk),.reset(reset3));
  counter len4_count(.count(len_counter4),.clk(clk),.reset(reset4));

  reg [7:0] len1, len2, len3, len4;
  always @(*) begin
  if ((note[17:16] === 2'b00) && (freq1 === 8'd0)) begin
    freq1 <= note[7:0];
    len1 <= note[15:8];
  end
  if ((note[17:16] === 2'b01) && (freq2 === 8'd0)) begin
    freq2 <= note[7:0];
    len2 <= note[15:8];
  end
  if ((note[17:16] === 2'b10) && (freq3 === 8'd0)) begin
    freq3 <= note[7:0];
    len3 <= note[15:8];
  end
  if ((note[17:16] === 2'b01) && (freq4 === 8'd0)) begin
    freq4 <= note[7:0];
    len4 <= note[15:8];
  end
  end

  // This bit is sketchy, the goal is it turns next_note on whenever a note is played, and then shuts it back off again, so it can be turned on again.
  always @({len1, len2, len3, len4, freq1, freq2, freq3, freq4}) begin
    next_note <= 1;
  end
  always @(posedge clk) begin
    next_note <= 0;
  end

always @(len1) begin
  reset1 <= 1;
end
always @(len2) begin
  reset2 <= 1;
end
always @(len3) begin
  reset3 <= 1;
end
always @(len4) begin
  reset4 <= 1;
end


  always @(posedge clk) begin
  // Control counter reset and frequencies
    if (len_counter1 === len1) begin
      reset1 <= 1;
      freq1 <= 8'd0;
      $display("Tripped, %h", note);
    end
    else begin
      reset1 <= 0;
    end
    if (len_counter2 === len2) begin
      reset2 <= 1;
      freq2 <= 8'd0;
    end
    else begin
      reset2 <= 0;
    end
    if (len_counter3 === len3) begin
      reset3 <= 1;
      freq3 <= 8'd0;
    end
    else begin
      reset3 <= 0;
    end
    if (len_counter4 === len4) begin
      reset4 <= 1;
      freq4 <= 8'd0;
    end
    else begin
      reset4 <= 0;
    end
  end

endmodule
