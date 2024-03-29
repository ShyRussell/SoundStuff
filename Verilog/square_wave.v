// Sabrina Pereira, Shy Russell, Jonah Spicher
/*-----------------------------------------------------------------------------
Square Wave Generator
-----------------------------------------------------------------------------*/
`include "register.v"
`include "counter.v"

module square_wave
#(parameter resolution_bits = 8, parameter counter_width = 8, parameter initial_q=0)
(
    output [resolution_bits-1:0] square_out,
    input  clk,   // System clock
    input  [counter_width-1:0] frequency_control  // Control for the output frequency

);

// Wires for D-flip-flop that generates square wave
wire  [resolution_bits-1:0]  d_to_q_inv; // Wire ~q to d
reg  inv_trigger; //Tell when to invert signal

// Wires for counter
wire  [counter_width-1:0]  count;


d_flip_flop #(.width(resolution_bits), .initial_q(initial_q)) sqwave_generator(.q(square_out),.q_inv(d_to_q_inv),.d(d_to_q_inv),.clk(inv_trigger));

counter #(.width(counter_width)) counter(.count(count),.clk(clk),.reset(inv_trigger));


// Controls for reset and waves
always @* begin
if (frequency_control == 0)
  inv_trigger=0;
else if (count == frequency_control>>1 || count > frequency_control>>1 || count < 0)
  inv_trigger=1;
else
  inv_trigger=0;
end

endmodule
