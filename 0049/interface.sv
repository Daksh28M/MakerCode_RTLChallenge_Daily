module iir_biquad #(
    parameter DATA_WIDTH = 8
)(
    input  wire                       clk,
    input  wire                       reset,
    input  wire signed [DATA_WIDTH-1:0]    data_in,
    output wire signed [DATA_WIDTH-1:0]    data_out
);

localparam b0 = 1, b1 = 2, b2 = 1, a1 = 1;

reg signed [DATA_WIDTH-1:0] data_in_reg;

reg signed [2*DATA_WIDTH-1:0] data_out_reg;

reg signed [DATA_WIDTH-1:0] data_in_prev1;
reg signed [DATA_WIDTH-1:0] data_in_prev2;

reg signed [DATA_WIDTH-1:0] data_out_prev;

// your implementation here
always_ff @(posedge clk or posedge reset) begin
    if(reset) begin
        data_in_reg <= 'b0;
        data_out_reg <= 'b0;
        data_in_prev1 <= 'b0;
        data_in_prev2 <= 'b0;
        data_out_prev <= 'b0;
    end
    else begin
        
        data_in_prev1 <= data_in;
        data_in_prev2 <= data_in_prev1;

        data_out_prev <= data_out;

        data_out_reg <= (b0*data_in + b1*data_in_prev1 + b2*data_in_prev2 - a1*data_out_prev)>>>3;
    end
end

assign data_out = data_out_reg[7:0];

endmodule