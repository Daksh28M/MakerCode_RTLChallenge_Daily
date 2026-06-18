module dual_edge_dff #(
    parameter DATA_WIDTH = 8
)(
    input  wire                                clk,
    input  wire                                rst_n,
    input  wire [DATA_WIDTH-1:0]               data_in,
    output wire [DATA_WIDTH-1:0]               data_out
);
// your implementation here
reg [DATA_WIDTH-1:0] data_reg;

always @(posedge clk or negedge clk) begin
    if(!rst_n) begin
        data_reg <= {DATA_WIDTH{1'b0}};
    end
    else begin
        data_reg <= data_in;
    end
end

assign data_out = data_reg;
endmodule
