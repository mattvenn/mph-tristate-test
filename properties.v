always @(*)
    if(!active) begin
        assert(wbs_ack_o    != buf_wbs_ack_o);
        assert(wbs_dat_o    == 32'bz);
        assert(la_data_out  == 32'bz);
        assert(io_out       == `MPRJ_IO_PADS'bz);
        assert(io_oeb       == `MPRJ_IO_PADS'bz);
    end
