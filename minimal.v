`default_nettype none
module top(
    input clk,
    output [7:0] out
);

    `ifdef COCOTB_SIM
        initial begin
            $dumpfile ("minimal.vcd");
            $dumpvars (0, top);
            #1;
        end
    `endif
    
    reg [1:0] active = 2'b01;
    reg [5:0] counter = 0;

    min #(.max(10)) min0(.clk(clk), .active(active[0]), .out(out));
    min #(.max(20)) min1(.clk(clk), .active(active[1]), .out(out));

    always @(posedge clk) begin
        counter <= counter + 1;
        if(counter == 0)
            active <= active ^ 2'b11;
    end

endmodule

module min #(
        parameter max = 10
    )(
    input clk,
    input active,
    output [7:0] out
    );

    reg [7:0] counter = 0;
    always @(posedge clk) begin
        counter <= counter + 1;
        if(counter == max)
            counter <= 0;
    end
    assign out = active ? counter : 8'bz;

endmodule
