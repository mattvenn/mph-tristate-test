always @(*) begin
    if(active) begin
        wbsackbuf: assert(wbs_ack_o    == buf_wbs_ack_o);
        wbsdatbuf: assert(wbs_dat_o    == buf_wbs_dat_o);
        ladatabuf: assert(la_data_out  == buf_la_data_out);
        iooutbuf : assert(io_out       == buf_io_out);
        iooebbuf : assert(io_oeb       == buf_io_oeb);
    end
    if(!active) begin
        wbsackz  : assert(wbs_ack_o    == 1'b0);
        wbsdatz  : assert(wbs_dat_o    == 32'b0);
        ladataz  : assert(la_data_out  == 32'b0);
        iooutz   :  assert(io_out       == `MPRJ_IO_PADS'b0);
        iooebz   :  assert(io_oeb       == `MPRJ_IO_PADS'b0);
    end
end
