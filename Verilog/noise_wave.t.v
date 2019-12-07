// Sabrina Pereira, Shy Russell, Jonah Spicher
`include "noise_wave.v"

module noise_wave_test ();

    wire [7:0] noise_out;
    reg clk;


    // Clock generation
    initial clk=0;
    always #10 clk = !clk;


    // Instantiate fake CPU
    noise_wave #(4) noise_wave (.noise_out(noise_out),.clk(clk));
    // Test sequence
    initial begin

      // $readmemh("asmtest/branch.text", cpu.memory.mem,0);

    	// Dump waveforms to file
    	$dumpfile("noise_wave.vcd");
    	$dumpvars();


    	// End execution after some time delay
    	#2000 $finish();
    end

endmodule
