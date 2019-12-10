// Sabrina Pereira, Shy Russell, Jonah Spicher
//`include "square_wave.v"
`include "input_controls.v"

module input_test ();

    wire [7:0] square_out;
    reg clk;
    wire  [7:0] freq1, freq2, freq3, freq4;


    // Clock generation
    initial clk=0;
    always #10 clk = !clk;


    // square_wave square_wave(.square_out(square_out),.clk(clk),.frequency_control(frequency_control));
    controls in_ctrls(.freq1(freq1),.freq2(freq2),.freq3(freq3),.freq4(freq4),.clk(clk));

    // Test sequence
    initial begin


    	// Dump waveforms to file
    	$dumpfile("inputs.vcd");
    	$dumpvars();
      $readmemh("notes.dat", in_ctrls.music_storage.mem);

    	// End execution after some time delay
      #15000
    	$finish();
    end

endmodule
