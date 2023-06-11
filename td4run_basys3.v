// Basys 3

module TD4run(
    input wire [0:0] CLK, RST,
    input wire [3:0] SW,
    output wire [4:0] LED
    );

    wire [0:0] rst_sig, clk_out;
    ClockDivider clkdivider(.clk_in(CLK), .clk_out(clk_out));
    POR por(.clk(clk_out), .rst_n(RST), .rst_out(rst_sig));
    TD4core td4(.clk(clk_out), .rst_n(rst_sig), .indata(SW), .outdata(LED[3:0]));
    
    assign LED[4] = clk_out;

endmodule
