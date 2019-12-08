// Sabrina Pereira, Shy Russell, Jonah Spicher
`include "noise_wave.v"

module noise_wave_test ();

    wire [7:0] noise_out;
    reg clk;
    integer f;


    // Clock generation
    initial clk=0;
    always #10 clk = !clk;

    initial begin
      f = $fopen("output.txt","w");
    end

    always @(posedge clk) begin
      $fwrite(f,"%d\n",  $signed(noise_out));
    end

    // Instantiate fake CPU
    noise_wave #(4) noise_wave (.noise_out(noise_out),.clk(clk));
    // Test sequence
    always begin

    	// Dump waveforms to file
    	$dumpfile("noise_wave.vcd");
    	$dumpvars();


    	// End execution after some time delay
    	#2000
      $fclose(f);
      #1 $finish();
    end

endmodule
