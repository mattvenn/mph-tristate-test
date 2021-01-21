# cocotb setup
export COCOTB_REDUCED_LOG_FMT=1
MODULE = test_wrapper
TOPLEVEL = top
VERILOG_SOURCES = minimal.v

include $(shell cocotb-config --makefiles)/Makefile.sim
