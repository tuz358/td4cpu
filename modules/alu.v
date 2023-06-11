// ALU
// 4-bit adder

module ALU(
    input wire [3:0] A,B_im,
    output wire [3:0] S,
    output C // Carry flag
    );
    
    assign {C, S} = A + B_im;
endmodule
