module sequence_detector #(
    parameter PATTERN = 4'b1011
)(
    input  wire                                clk,
    input  wire                                rst_n,
    input  wire                                data_in,
    output wire                                pattern_detected
);
// your implementation here

reg [PATTERN-1:0] pattern_buf;

always @(posedge clk) begin
    if(!rst_n) begin
        pattern_buf <= {PATTERN{1'b0}};
    end
    else begin
        pattern_buf[3:1] <= pattern_buf[2:0];
        pattern_buf[0] <= data_in;
    end

end

assign pattern_detected = &(~( PATTERN ^ pattern_buf ));

endmodule
