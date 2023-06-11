
module ClockDivider(
    input wire [0:0] clk_in,
    output wire [0:0] clk_out
    );

  // 100MHz(Basys3) / 2**26 = 1.5Hz
  reg [25:0] cnt26 = 26'b0000_0000_0000_0000_0000_0000_00;
  always @( posedge clk_in ) cnt26 <= cnt26 + 1'b1;
  assign clk_out = cnt26[25];
  
endmodule
