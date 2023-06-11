// ROM
// 64-bit memory(16x8-bit)

module ROM(
    input wire [3:0] addr,
    output wire [7:0] data
    );

    reg [7:0] rom [0:15]; // Sixteen 8-bit data values

    initial $readmemb("ramen_timer.txt", rom);
    
    assign data = rom[addr];
endmodule
