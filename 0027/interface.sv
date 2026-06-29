module UpDownCounter (
    input wire clk,         // Clock input
    input wire rst,         // Reset input
    input wire up_down,    // Up/Down control input
    output reg [3:0] count // 4-bit counter output
);

// your implementation here
always_ff @(posedge clk) begin
    if(rst) begin
        count <= 4'b0;
    end
    else begin
        if(up_down) count <= count + 1'b1;
        else count <= count - 1'b1;
    end
end
endmodule