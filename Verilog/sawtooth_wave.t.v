// Sabrina Pereira, Shy Russell, Jonah Spicher
`include "sawtooth_wave.v"

module sawtooth_wave_test ();

    wire [7:0] sawtooth_out;
    reg clk;
    reg  [7:0] frequency_control;

    // Clock generation
    initial clk=0;
    always #10 clk = !clk;

    initial frequency_control=8'd32;

    // Instantiate Sawtooth Wave Generator
    //square_wave square_wave(.square_out(square_out),.clk(clk),.frequency_control(frequency_control));
    sawtooth_wave saw_wave(.sawtooth_out(sawtooth_out),.clk(clk),.frequency_control(frequency_control));

    // Test sequence
    initial begin

    	// Dump waveforms to file
    	$dumpfile("sawtooth_wave.vcd");
    	$dumpvars();

    	// End execution after some time delay
    	#2000 $finish();
    end

endmodule
