`default_nettype none
module top(
    input clk,
    input rst,
    input [1:0] active,
    input  sig_in,
    output sig_out
);

    `ifdef COCOTB_SIM
        initial begin
            $dumpfile ("minimal.vcd");
            $dumpvars (0, top);
            #1;
        end
    `endif
    
    min #(.INVERT(0)) min0(.rst(rst), .clk(clk), .active(active[0]), .out(sig_out), .in(sig_in));
    min #(.INVERT(1)) min1(.rst(rst), .clk(clk), .active(active[1]), .out(sig_out), .in(sig_in));

endmodule

module min #(
        parameter INVERT = 0
    )(
    input rst,
    input clk,
    input active,
    input in,
    output out
    );

    reg q;

    always @(posedge clk) begin
        if(rst)
            q <= 0;
        else
            q <= INVERT ? !in : in;
    end

    assign out = active ? q : 1'bz; 

endmodule
