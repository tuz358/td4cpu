// Program counter (4-bit)

module PC(
    input clk,
    input rst_n,
    input wire [3:0] in,
    input wire [0:0] load,
    output wire [3:0] out_addr
    );
    
    reg [3:0] cnt = 4'b0000;
    
    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 4'b0000;
        end
        else if (load == 0) begin
            cnt <= in;
        end
        else begin
            cnt <= cnt + 1'b1;
        end
    end
    
    assign out_addr = cnt;
endmodule
