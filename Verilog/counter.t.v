// Sabrina Pereira, Shy Russell, Jonah Spicher
/*-----------------------------------------------------------------------------
Counter Test Bench
-----------------------------------------------------------------------------*/

`include "counter.v"

module counter_test ();

    wire [3:0] count;
    reg clk;
    reg reset;

    // Clock generation
    initial clk=0;
    always #10 clk = !clk;

    initial reset=0;

    // Instantiate Counter
    counter #(4) counter (.count(count),.clk(clk),.reset(reset));

    // Test sequence
    initial begin

    	// Dump waveforms to file
    	$dumpfile("counter.vcd");
    	$dumpvars();

    	// Assert reset pulses
    	reset = 0; #200;
    	reset = 1; #230;
      reset = 0; #200;
    	reset = 1; #230;

    	// End execution after some time delay
    	#2000 $finish();
    end

endmodule
