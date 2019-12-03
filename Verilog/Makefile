# Liv Kelley, Jamie O'Brien, Sabrina Pereira
# Scripts to run files
#-------------------------------------------------------------------------------
# To run, type "make run" into terminal. The output should be the testbench
# results for the file that "TEST :=" is set to. Set "TEST :=" to be either
# "multiplier" or "counter" for the test you want to run.
#-------------------------------------------------------------------------------

ICARUS_OPTIONS := -Wall
IVERILOG := iverilog $(ICARUS_OPTIONS)
SIM := vvp

TEST := square_wave

# square_wave.vvp: square_wave.v
square_wave.vvp: square_wave.t.v square_wave.v
	$(IVERILOG) -o $@ $<

counter.vvp: counter.t.v counter.v
	$(IVERILOG) -o $@ $<

# Shortcut (phony) targets for convenience
compile: $(TEST).vvp

run: $(TEST).vvp
	$(SIM) $<

clean:
	-rm -f $(TEST).vvp


.PHONY: compile run clean
