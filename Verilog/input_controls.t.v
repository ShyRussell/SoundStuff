// Sabrina Pereira, Shy Russell, Jonah Spicher
`include "square_wave.v"
`include "input_controls.v"

module input_test ();

    wire [7:0] square_out;
    reg clk;
    wire  [7:0] frequency_control;
    reg [3:0] switch_inputs;


    // Clock generation
    initial clk=0;
    always #10 clk = !clk;

    initial switch_inputs=4'd1;

    square_wave square_wave(.square_out(square_out),.clk(clk),.frequency_control(frequency_control));
    controls in_ctrls(.switch(switch_inputs),.freq1(frequency_control));

    // Test sequence
    initial begin


    	// Dump waveforms to file
    	$dumpfile("inputs.vcd");
    	$dumpvars();
      #500
      switch_inputs = 4'd2;
      #500
      switch_inputs = 4'd3;
      #500
      switch_inputs = 4'd4;
      #500
      switch_inputs = 4'd5;
      #500
      switch_inputs = 4'd10;
      #500
      switch_inputs = 4'd15;
      #500
      switch_inputs = 4'd0;
      #500

    	// End execution after some time delay
    	$finish();
    end

endmodule
