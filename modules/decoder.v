// Instruction decoder

module Decoder(
        input wire [3:0] opcode,
        input wire [0:0] C, // Carry flag
        output wire [1:0] select,
        output wire [3:0] load
    );


    function [5:0] DECODE;
        input [3:0] opcode;
        input [0:0] C; // Carry flag
    begin
        case(opcode)
            4'b0000:   DECODE = 6'b00_1110; // ADD A,Im
            4'b0001:   DECODE = 6'b01_1110; // MOV A,B
            4'b0010:   DECODE = 6'b10_1110; // IN A
            4'b0011:   DECODE = 6'b11_1110; // MOV A,Im
            4'b0100:   DECODE = 6'b00_1101; // MOV B,A
            4'b0101:   DECODE = 6'b01_1101; // ADD B,Im
            4'b0110:   DECODE = 6'b10_1101; // IN B
            4'b0111:   DECODE = 6'b11_1101; // MOV B,Im
            4'b1001:   DECODE = 6'b01_1011; // OUT B
            4'b1011:   DECODE = 6'b11_1011; // OUT Im
            4'b1111:   DECODE = 6'b11_0111; // JMP Im
            4'b1110:   DECODE = C ? 6'bXX_1111 : 6'b11_0111; // JNC Im (jump to Im if C==0)
        endcase
    end
    endfunction

    assign {select, load} = DECODE(opcode, C);

endmodule
