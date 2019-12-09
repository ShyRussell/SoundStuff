// Sabrina Pereira, Shy Russell, Jonah Spicher
/*-----------------------------------------------------------------------------
Sawtooth Wave Generator
-----------------------------------------------------------------------------*/
`include "sawtooth_LUT.v"
`include "square_wave.v"

module sawtooth_wave
#(parameter sqwave_counter_width = 8)
(
    output [7:0] sawtooth_out,
    input  clk,   // System clock
    input  [sqwave_counter_width-1:0] frequency_control  // How many clock cycles for period, must be multiple of 32 clock cycles

);

// Create appropriately slowed clock for sawtooth wave
wire counter_clk;
square_wave #(.resolution_bits(1), .counter_width(8))  clock_modifier(.square_out(counter_clk),.clk(clk),.frequency_control(frequency_control>>4));

// Create counter for selecting output values
wire [3:0] value_select;
counter #(4) counter (.count(value_select),.clk(counter_clk),.reset(1'b0));

// Outputs selected from LUT
sawtooth_LUT sawtooth_LUT(.sawtooth_out(sawtooth_out),.control(value_select));

endmodule
