// Sabrina Pereira, Shy Russell, Jonah Spicher

/*-----------------------------------------------------------------------------
D-flip flop and D-flip-flop with enable
-----------------------------------------------------------------------------*/
`include "register.v"
`include "counter.v"

module square_wave
(
    output [7:0] square_out,
    input  clk,   // System clock
    input  [7:0] frequency_control  // Control for the output frequency

);

// Wires for D-flip-flop that generates square wave
wire  [7:0]  d_to_q_inv; // Wire ~q to d
reg  inv_trigger; //Tell when to invert signal

// Wires for counter
wire  [7:0]  count;
// wire  [7:0]  count_inv; //dump for ~q
//
// initial count = 8'b0;


d_flip_flop sqwave_generator(.q(square_out),.q_inv(d_to_q_inv),.d(d_to_q_inv),.clk(clk));

counter counter(.count(count),.clk(clk),.reset(inv_trigger));


// Controls for reset and waves
always @* begin
if (count == frequency_control)
  inv_trigger=1;
else
  inv_trigger=0;
end

endmodule
