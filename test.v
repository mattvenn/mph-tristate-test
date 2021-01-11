`default_nettype none

// copied from caravel.v
`timescale 1 ns / 1 ps
`define UNIT_DELAY #1
`define USE_POWER_PINS


//`include "libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
//`include "libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"
`include "/home/matt/work/asic-workshop/pdks/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
`include "/home/matt/work/asic-workshop/pdks/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"

module test (
    input wire clk,
    input wire reset,
    input wire [7:0] tri_in,
    output wire [7:0] tri_out
    );

    `ifdef COCOTB_SIM
        initial begin
            $dumpfile ("test.vcd");
            $dumpvars (0, test);
            #1;
        end
    `endif

    // hand placed
    // example taken from https://github.com/shalan/DFFRAM/blob/main/Handcrafted/Models/DFFRAMBB.v#L205
    // https://antmicro-skywater-pdk-docs.readthedocs.io/en/86-cell_cross_index/contents/libraries/sky130_fd_sc_hd/cells/ebufn/README.html
    wire [7:0] enable_n = {8{reset}};


    // can't get this to work with formal tools due to issues in the standard cell libs
    `ifndef FORMAL 
    sky130_fd_sc_hd__ebufn_4 tri_buf[7:0] (
        .A(tri_in),
        .Z(tri_out),
        .TE_B(enable_n),
        .VPWR(1'b1),
        .VGND(1'b0),
        .VPB(1'b1),
        .VNB(1'b0)
        );

    // inferred
    `else
    assign tri_out = enable_n ? tri_in : 8'bz;
    `include "properties.v"
    `endif
    
endmodule
`default_nettype wire
