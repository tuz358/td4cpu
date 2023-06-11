// TD4 CPU core

module TD4core(
    input wire [0:0] clk, rst_n,
    input wire [3:0] indata,
    output wire [3:0] outdata
    );

    wire [3:0] reg_out_a, reg_out_b;
    wire [0:0] reg_out_c;
    wire [3:0] mux4_out;
    wire [3:0] alu_out_s;
    wire [0:0] alu_out_c;
    wire [3:0] pc_out;
    wire [7:0] rom_out;
    wire [1:0] dec_out_sel;
    wire [3:0] dec_out_load;

    PC pc(.clk(clk), .rst_n(rst_n), .in(alu_out_s), .load(dec_out_load[3]), .out_addr(pc_out));
    Regfile regfile(.clk(clk), .rst_n(rst_n), .load(dec_out_load[2:0]), .ia(alu_out_s), .ib(alu_out_s), .ic(alu_out_s), .Cin(alu_out_c), .ra(reg_out_a), .rb(reg_out_b), .rc(outdata), .C(reg_out_c));
    Mux4 mux4(.d0(reg_out_a), .d1(reg_out_b), .d2(indata), .d3(4'b0000), .sel(dec_out_sel), .y(mux4_out));
    Decoder decoder(.opcode(rom_out[7:4]), .C(reg_out_c), .select(dec_out_sel), .load(dec_out_load));
    ALU alu(.A(mux4_out), .B_im(rom_out[3:0]), .S(alu_out_s), .C(alu_out_c));
    ROM rom(.addr(pc_out), .data(rom_out));

endmodule
