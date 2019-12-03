// Sabrina Pereira, Shy Russell, Jonah Spicher
`include "square_wave.v"

module square_wave_test ();

    wire [7:0] square_out;
    reg clk;
    reg  [7:0] frequency_control;


    // Clock generation
    initial clk=0;
    always #10 clk = !clk;

    initial frequency_control=8'd20;

    // Instantiate fake CPU
    square_wave square_wave(.square_out(square_out),.clk(clk),.frequency_control(frequency_control));

    // Test sequence
    initial begin

      // $readmemh("asmtest/branch.text", cpu.memory.mem,0);

    	// Dump waveforms to file
    	$dumpfile("square_wave.vcd");
    	$dumpvars();

    	// Assert reset pulse
    	// reset = 0; #20;
    	// reset = 1; #10;

    	// End execution after some time delay
    	#2000 $finish();
    end

endmodule
