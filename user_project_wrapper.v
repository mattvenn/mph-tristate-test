`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oen,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7.
    inout [`MPRJ_IO_PADS-8:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2
);

    `ifdef COCOTB_SIM
        initial begin
            $dumpfile ("user_project_wrapper.vcd");
            $dumpvars (0, user_project_wrapper);
            #1;
        end
    `endif
    /*--------------------------------------*/
    /* User project is instantiated  here   */
    /*--------------------------------------*/
    
    /*
    genvar i;
    generate
    for( i = 0; i < 8 ; i = i + 1) begin
    wrapper project0(
        // interface as user_proj_example.v
        .wb_clk_i   (wb_clk_i),
        .wb_rst_i   (wb_rst_i),
        .wbs_stb_i  (wbs_stb_i),
        .wbs_cyc_i  (wbs_cyc_i),
        .wbs_we_i   (wbs_we_i),
        .wbs_sel_i  (wbs_sel_i),
        .wbs_dat_i  (wbs_dat_i),
        .wbs_adr_i  (wbs_adr_i),
        .wbs_ack_o  (wbs_ack_o),
        .wbs_dat_o  (wbs_dat_o),

        // only provide first 32 bits to reduce wiring congestion
        .la_data_in (la_data_in [31:0]),
        .la_data_out(la_data_out[31:0]),
        .la_oen     (la_oen[31:0]),

        // IOs
        .io_in      (io_in),
        .io_out     (io_out),
        .io_oeb     (io_oeb),
        
        // active input, only connect tristated outputs if this is high
        .active     (la_data_in[32+i])
        );
    end
    endgenerate
    */
    

            wrapper proj_0(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+0])
                );
        
            wrapper proj_1(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+1])
                );
        
            wrapper proj_2(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+2])
                );
        
            wrapper proj_3(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+3])
                );
        
            wrapper proj_4(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+4])
                );
        
            wrapper proj_5(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+5])
                );
        
            wrapper proj_6(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+6])
                );
        
            wrapper proj_7(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+7])
                );
        
            wrapper proj_8(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+8])
                );
        
            wrapper proj_9(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+9])
                );
        
            wrapper proj_10(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+10])
                );
        
            wrapper proj_11(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+11])
                );
        
            wrapper proj_12(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+12])
                );
        
            wrapper proj_13(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+13])
                );
        
            wrapper proj_14(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+14])
                );
        
            wrapper proj_15(
                // interface as user_proj_example.v
                .wb_clk_i   (wb_clk_i),
                .wb_rst_i   (wb_rst_i),
                .wbs_stb_i  (wbs_stb_i),
                .wbs_cyc_i  (wbs_cyc_i),
                .wbs_we_i   (wbs_we_i),
                .wbs_sel_i  (wbs_sel_i),
                .wbs_dat_i  (wbs_dat_i),
                .wbs_adr_i  (wbs_adr_i),
                .wbs_ack_o  (wbs_ack_o),
                .wbs_dat_o  (wbs_dat_o),

                // only provide first 32 bits to reduce wiring congestion
                .la_data_in (la_data_in [31:0]),
                .la_data_out(la_data_out[31:0]),
                .la_oen     (la_oen[31:0]),

                // IOs
                .io_in      (io_in),
                .io_out     (io_out),
                .io_oeb     (io_oeb),
                
                // active input, only connect tristated outputs if this is high
                .active     (la_data_in[32+15])
                );
        
endmodule	// user_project_wrapper
`default_nettype wire
