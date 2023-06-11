// data selector
// 4:1 multiplexer (4-bit)

module Mux4(
    input [3:0] d0,d1,d2,d3,
    input [1:0] sel,
    output [3:0] y
    );
    
    assign y = sel[1] ? (sel[0] ? d3 : d2) : (sel[0] ? d1 : d0);
    
endmodule
