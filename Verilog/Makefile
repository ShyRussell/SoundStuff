# Sabrina Pereira, Shy Russell, Jonah Spicher
# Scripts to run files
#-------------------------------------------------------------------------------
# To run, type "make run" into terminal. The output should produce a waveform
# result for the file that "TEST :=" is set to. Set "TEST :=" to be the name of
# the module/test bench you want to run, do not include file format (.v)
#-------------------------------------------------------------------------------

ICARUS_OPTIONS := -Wall
IVERILOG := iverilog $(ICARUS_OPTIONS)
SIM := vvp

TEST := sound_card

sound_card.vvp: sound_card.t.v sound_card.v
	$(IVERILOG) -o $@ $<

square_wave.vvp: square_wave.t.v square_wave.v
	$(IVERILOG) -o $@ $<

sawtooth_wave.vvp: sawtooth_wave.t.v sawtooth_wave.v
	$(IVERILOG) -o $@ $<

counter.vvp: counter.t.v counter.v
	$(IVERILOG) -o $@ $<

input_controls.vvp: input_controls.t.v input_controls.v
	$(IVERILOG) -o $@ $<

noise_wave.vvp: noise_wave.t.v noise_wave.v
	$(IVERILOG) -o $@ $<

sawtooth_LUT.vvp: sawtooth_LUT.t.v sawtooth_LUT.v
	$(IVERILOG) -o $@ $<

shifter.vvp: shifter.t.v shifter.v
	$(IVERILOG) -o $@ $<

# Shortcut (phony) targets for convenience
compile: $(TEST).vvp

run: $(TEST).vvp
	$(SIM) $<

clean:
	-rm -f $(TEST).vvp

.PHONY: compile run clean
