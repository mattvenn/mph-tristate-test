`default_nettype none

// copied from caravel.v
`timescale 1 ns / 1 ps
`define UNIT_DELAY #1
`define USE_POWER_PINS

//`include "libs.ref/sky130_fd_io/verilog/sky130_fd_io.v"
//`include "libs.ref/sky130_fd_io/verilog/sky130_ef_io.v"
//`include "libs.ref/sky130_fd_io/verilog/sky130_ef_io__gpiov2_pad_wrapped.v"

`include "libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
`include "libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"
`include "libs.ref/sky130_fd_sc_hvl/verilog/primitives.v"
`include "libs.ref/sky130_fd_sc_hvl/verilog/sky130_fd_sc_hvl.v"

module test (
    input wire clk,
    input wire enable,
    input wire tri_in,
    output wire tri_out
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
    sky130_fd_sc_hd__ebufn_4 tri_buf (
        .A( tri_in ),
        .Z(tri_out),
        .TE_B(!enable),
        .VPWR(1'b1),
        .VGND(1'b0),
        .VPB(1'b1),
        .VNB(1'b0)
        );

    // inferred
//    assign tri_out = enable ? tri_in : 1'bz;
    
endmodule
