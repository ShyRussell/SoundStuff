// Sabrina Pereira, Shy Russell, Jonah Spicher
`include "square_wave.v"

module square_wave_test ();

    wire [7:0] square_out;
    reg clk;
    reg  [7:0] frequency_control;

    // Clock generation
    initial clk=0;
    always #10 clk = !clk;

    initial frequency_control=8'd2;

    // Instantiate Square Wave Generator
    square_wave #(.resolution_bits(8), .counter_width(8),.initial_q(8'b10000000)) square_wave(.square_out(square_out),.clk(clk),.frequency_control(frequency_control));

    // Test sequence
    initial begin

    	// Dump waveforms to file
    	$dumpfile("square_wave.vcd");
    	$dumpvars();

    	// End execution after some time delay
    	#2000 $finish();
    end

endmodule
