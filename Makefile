# cocotb setup
export COCOTB_REDUCED_LOG_FMT=1
MODULE = test_wrapper
TOPLEVEL = top
#VERILOG_SOURCES = minimal.v
VERILOG_SOURCES = top.lvs.powered.v
COMPILE_ARGS=-I /home/matt/work/asic-workshop/pdks/sky130A/ -DSIM -DFUNCTIONAL

include $(shell cocotb-config --makefiles)/Makefile.sim
