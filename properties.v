always @(*) begin
    if(active) begin
        wbsackbuf: assert(wbs_ack_o    == buf_wbs_ack_o);
        wbsdatbuf: assert(wbs_dat_o    == buf_wbs_dat_o);
        ladatabuf: assert(la_data_out  == buf_la_data_out);
        iooutbuf : assert(io_out       == buf_io_out);
        iooebbuf : assert(io_oeb       == buf_io_oeb);
    end
    if(!active) begin
        wbsackz  : assert(wbs_ack_o    == 1'bz);
        wbsdatz  : assert(wbs_dat_o    == 32'bz);
        ladataz  : assert(la_data_out  == 32'bz);
        iooutz   :  assert(io_out       == `MPRJ_IO_PADS'bz);
        iooebz   :  assert(io_oeb       == `MPRJ_IO_PADS'bz);
    end
end
