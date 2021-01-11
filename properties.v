always @(*)
    if(reset)
        assert(tri_out == 8'bz);
