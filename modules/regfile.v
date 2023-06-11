// Register file

module Regfile(
    input wire clk,
    input wire rst_n,
    input wire [2:0] load,
    input wire [3:0] ia,ib,ic,
    input wire [0:0] Cin,
    output reg [3:0] ra,rb,rc,
    output reg [0:0] C // Carry flag
    );
    
    always @( posedge clk ) begin
        ra <= rst_n ? (load[0] ? ra : ia) : 4'b0000;
        rb <= rst_n ? (load[1] ? rb : ib) : 4'b0000;
        rc <= rst_n ? (load[2] ? rc : ic) : 4'b0000;
        C  <= rst_n ? Cin : 1'b0;
    end
endmodule
