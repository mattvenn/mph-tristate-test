# User config
set ::env(DESIGN_NAME) wrapper

# Change if needed
set ::env(VERILOG_FILES) "\
    ./designs/wrapper/src/wrapper.v \
    ./designs/wrapper/src/seven_segment_seconds/seven_segment_seconds.v"

# Fill this
set ::env(CLOCK_PERIOD) "10"
set ::env(CLOCK_PORT) "wb_clk_i"

set ::env(CELL_PAD) 4

# we are a macro
set ::env(DESIGN_IS_CORE) 0
set ::env(FP_PDN_CORE_RING) 0
set ::env(GLB_RT_MAXLAYER) 5

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

