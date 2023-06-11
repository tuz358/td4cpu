// Power On Reset

module POR(
    input clk,
    input rst_n,
    output rst_out
    );
    
    reg [7:0] dout8 = 8'b11111111;
    always @( posedge clk ) dout8 = {dout8[6:0], rst_n};
    assign rst_out = (dout8 == 8'b00000000);

endmodule
