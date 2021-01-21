# cocotb setup
export COCOTB_REDUCED_LOG_FMT=1
MODULE = test_wrapper
TOPLEVEL = user_project_wrapper
#VERILOG_SOURCES = user_project_wrapper.v wrapper.v seven_segment_seconds/seven_segment_seconds.v
VERILOG_SOURCES = user_project_wrapper.lvs.powered.v wrapper.lvs.powered.v

COMPILE_ARGS=-I /home/matt/work/asic-workshop/pdks/sky130A/ -DSIM -DFUNCTIONAL -DMPRJ_IO_PADS=38    

include $(shell cocotb-config --makefiles)/Makefile.sim
