// Sabrina Pereira, Shy Russell, Jonah Spicher
/*-----------------------------------------------------------------------------
Square Wave Test Bench
-----------------------------------------------------------------------------*/

`include "square_wave.v"

module square_wave_test ();

    wire square_out;
    reg clk;
    reg  [7:0] frequency_control;

    // Clock generation
    initial clk=0;
    always #10 clk = !clk;
    initial frequency_control=8'd0;

    // Instantiate Square Wave Generator
    // square_wave #(.resolution_bits(8), .counter_width(8),.initial_q(8'b10000000)) square_wave(.square_out(square_out),.clk(clk),.frequency_control(frequency_control));
    square_wave #(.resolution_bits(1), .counter_width(8)) square_wave(.square_out(square_out),.clk(clk),.frequency_control(frequency_control));



    // Test sequence
    initial begin

    	// Dump waveforms to file
    	$dumpfile("square_wave.vcd");
    	$dumpvars();

      #208
      frequency_control=8'd16;
      #208
      frequency_control=8'd2;
      #208
      frequency_control=8'd16;

    	// End execution after some time delay
    	#2000 $finish();
    end

endmodule
