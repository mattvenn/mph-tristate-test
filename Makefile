# cocotb setup
export COCOTB_REDUCED_LOG_FMT=1
MODULE = test
TOPLEVEL = test
VERILOG_SOURCES = test.v

COMPILE_ARGS=-I /home/matt/work/asic-workshop/pdks/sky130A/ -DSIM -DFUNCTIONAL

include $(shell cocotb-config --makefiles)/Makefile.sim
