# cocotb setup
export COCOTB_REDUCED_LOG_FMT=1
MODULE = test_wrapper
TOPLEVEL = top
#VERILOG_SOURCES = minimal.v
VERILOG_SOURCES = top.lvs.powered.v
COMPILE_ARGS=-I /home/matt/work/asic-workshop/pdks/sky130A/ -DSIM -DFUNCTIONAL

# these have to go in the powered
#`define UNIT_DELAY #1
#`define USE_POWER_PINS
#`include "libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
#`include "libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"

include $(shell cocotb-config --makefiles)/Makefile.sim
