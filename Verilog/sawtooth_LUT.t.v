// Sabrina Pereira, Shy Russell, Jonah Spicher
`include "sawtooth_LUT.v"

module sawtooth_LUT_test ();

    wire [7:0] sawtooth_out;
    reg  [3:0] control;

    // Clock generation
    // initial clk=0;
    // always #10 clk = !clk;

    // Instantiate LUT
    sawtooth_LUT sawtooth_LUT(.sawtooth_out(sawtooth_out),.control(control));

    // Test sequence
    initial begin

    	// Dump waveforms to file
    	$dumpfile("sawtooth_LUT.vcd");
    	$dumpvars();

    	// Test Control Values
    	control = 1; #10;
    	control = 8; #10;
      control = 15; #10;

    	// End execution after some time delay
    	#40 $finish();
    end

endmodule
