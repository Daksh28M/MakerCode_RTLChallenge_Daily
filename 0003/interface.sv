module ring_counter #(
    parameter COUNTER_WIDTH = 4
)(
    input  wire                                clk,
    input  wire                                rst_n,
    output wire [COUNTER_WIDTH-1:0]            count_out
);
// your implementation here

reg [COUNTER_WIDTH-1:0] count;

always @(posedge clk) begin
    if(!rst_n) begin
        count <= 'd1;
    end
    else begin
        if(count == 'b1 << (COUNTER_WIDTH - 1)) count <= 'b1;
        else count <= count << 1;
    end
end

assign count_out = count;
endmodule
