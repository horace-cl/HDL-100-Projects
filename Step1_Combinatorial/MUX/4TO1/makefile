# Makefile for Vivado Multiplexer Project

# Configuration
PROJECT_NAME = multiplexer
PROJECT_DIR = vivado_mux
PART = xc7a100tcsg324-1
MAIN_FILE = ../multiplexer.vhd
TESTBENCH_FILE = ../tb_multiplexer.vhd
SIMULATION_TIME = 1000ns
VCD_PATH = ../../../../../waveforms.vcd

# Vivado executable (adjust path if needed)
VIVADO = vivado

# Targets
.PHONY: all clean simulation synth implement bitstream program

all: bitstream

# Simulation only
simulation:
	$(VIVADO) -mode batch -source scripts/simulation.tcl -tclargs $(MAIN_FILE) $(TESTBENCH_FILE) $(PROJECT_DIR) $(PART) $(SIMULATION_TIME) $(VCD_PATH)

# Synthesis only
synth:
	$(VIVADO) -mode batch -source scripts/synthesis.tcl -tclargs $(MAIN_FILE) $(TESTBENCH_FILE) $(PROJECT_DIR) $(PART)

# Implementation only
implement:
	$(VIVADO) -mode batch -source scripts/implementation.tcl -tclargs $(PROJECT_DIR)

# Generate bitstream
bitstream: implement
	$(VIVADO) -mode batch -source scripts/bitstream.tcl -tclargs $(PROJECT_DIR)

# Program device (example - adjust for your board)
program: bitstream
	$(VIVADO) -mode batch -source scripts/program.tcl -tclargs $(PROJECT_DIR)

# Clean everything
clean:
	rm -rf $(PROJECT_DIR) vivado* *.jou *.log *.str .Xil
	find . -name "*.vcd" -delete

# Clean but keep project structure
clean_build:
	$(VIVADO) -mode batch -source scripts/clean_build.tcl -tclargs $(PROJECT_DIR)

# Help target
help:
	@echo "Available targets:"
	@echo "  simulation   - Run simulation only"
	@echo "  synth       - Run synthesis only"
	@echo "  implement   - Run implementation only"
	@echo "  bitstream   - Generate bitstream (default)"
	@echo "  program     - Program device (adjust for your board)"
	@echo "  clean       - Remove all generated files"
	@echo "  clean_build - Clean build artifacts but keep project"
	@echo "  all         - Run complete flow to bitstream"