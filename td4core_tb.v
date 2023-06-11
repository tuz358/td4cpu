`timescale 1ns/1ns

module td4core_tb;
    // Inputs
    reg [0:0] CLK, RST;
    reg [3:0] indata;
    // Outputs
    wire [3:0] outdata;
    
    wire [0:0] rst_sig;
    TD4core td4(.clk(CLK), .rst_n(rst_sig), .indata(indata), .outdata(outdata));
    POR por(.clk(CLK), .rst_n(RST), .rst_out(rst_sig));
    
    reg [7:0] cnt;
    initial begin
      // for icarus verilog
      //$dumpfile("TD4.vcd");
      //$dumpvars(0, td4core_tb);

      CLK <= 1'b0;
      RST <= 1'b0;
      indata <= 4'b0000;
      cnt <= 8'b00000000;
    end

    parameter PERIOD = 10; // [ms]
    always #( PERIOD/2 ) begin
      CLK <= ~CLK;
    end

    always @( posedge CLK ) begin
      //RST <= (cnt == 1'b1) ? 1'b0 : 1'b1;
      if (cnt == 8'd250) $finish;
      cnt <= cnt + 1'b1;
    end

endmodule
