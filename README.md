# Update

Hand placed now works given power is provided. Needed power because I have the 

    `define USE_POWER_PINS 
    
macro enabled. Without it I get many syntax errors in the standard cell libs.

# Hand placed

    sky130_fd_sc_hd__ebufn_4 tri_buf ( .A( tri_in ), .Z(tri_out), .TE_B(!enable) );

![hand placed](handplaced_tri.png)

# Inferred

    assign tri_out = enable ? tri_in : 1'bz;

![inferred](inferred_tri.png)
