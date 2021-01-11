# Hand placed

    sky130_fd_sc_hd__ebufn_4 tri_buf ( .A( tri_in ), .Z(tri_out), .TE_B(!enable) );

![hand placed](handplaced_tri.png)

# Inferred

    assign tri_out = enable ? tri_in : 1'bz;

![inferred](inferred_tri.png)
