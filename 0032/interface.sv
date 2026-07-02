module clock_divider #(
    parameter DIVIDE_FACTOR = 2
)(
    input  wire                    clk_in,
    input  wire                    reset,
    input  wire                    enable,
    output wire                    clk_out
);
// your implementation here
localparam CNT_WIDTH = $clog2(DIVIDE_FACTOR);

reg [CNT_WIDTH-1:0] counter;

wire out1;

reg out2;

always_ff @(posedge clk_in) begin
    if(reset) begin
        counter <= {CNT_WIDTH{1'b0}};
    end
    else if(enable) begin
        if(counter==DIVIDE_FACTOR-1) begin
            counter <= {CNT_WIDTH{1'b0}};
        end 
        else counter <= counter + 1'b1;
    end
end

always_ff @(negedge clk_in) begin
    out2 <= out1;
end

assign out1 = counter[CNT_WIDTH-1];
assign clk_out = out2 | out1;
endmodule