module johnson_counter #(
    parameter WIDTH = 4
)(
    input  wire                    clk,
    input  wire                    reset,
    input  wire                    enable,
    output wire [WIDTH-1:0]        count_out
);
// your implementation here
reg [WIDTH-1:0] count;

always @(posedge clk) begin
    if(reset) begin
        count <= {WIDTH{1'b0}};
    end
    else if(enable) begin
        count <= {count[WIDTH-2:0],~count[WIDTH-1]};
    end
    else count <= count;
end

assign count_out = count;

endmodule