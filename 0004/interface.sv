module ripple_counter #(
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
        count <= {COUNTER_WIDTH{1'b0}};
    end
    else begin
        count <= count + 1'b1;
    end
end

assign count_out = count;
endmodule
