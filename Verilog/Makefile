# Sabrina Pereira, Shy Russell, Jonah Spicher
# Scripts to run files
#-------------------------------------------------------------------------------
# To run, type "make run" into terminal. The output should be the testbench
# results for the file that "TEST :=" is set to. Set "TEST :=" to be either
# "multiplier" or "counter" for the test you want to run.
#-------------------------------------------------------------------------------

ICARUS_OPTIONS := -Wall
IVERILOG := iverilog $(ICARUS_OPTIONS)
SIM := vvp

TEST := sawtooth_wave

# square_wave.vvp: square_wave.v
square_wave.vvp: square_wave.t.v square_wave.v
	$(IVERILOG) -o $@ $<

sawtooth_wave.vvp: sawtooth_wave.t.v sawtooth_wave.v
# sawtooth_wave.vvp: square_wave.v sawtooth_wave.v
	$(IVERILOG) -o $@ $<

counter.vvp: counter.t.v counter.v
	$(IVERILOG) -o $@ $<

sawtooth_LUT.vvp: sawtooth_LUT.t.v sawtooth_LUT.v
	$(IVERILOG) -o $@ $<

# Shortcut (phony) targets for convenience
compile: $(TEST).vvp

run: $(TEST).vvp
	$(SIM) $<

clean:
	-rm -f $(TEST).vvp


.PHONY: compile run clean
