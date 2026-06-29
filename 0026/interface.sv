module seven_segment_driver #(
    parameter ACTIVE_HIGH = 1
)(
    input  wire [3:0]    bcd_digit,
    input  wire          enable,
    output wire [6:0]    segments,
    output wire          digit_valid
);
// your implementation here

reg [6:0] out_reg;
always @(*) begin
    if (enable) begin
        case(bcd_digit)
            'd0: out_reg <=(7'b0111111); 
            'd1: out_reg <=(7'b0000110); 
            'd2: out_reg <=(7'b1011011); 
            'd3: out_reg <=(7'b1001111); 
            'd4: out_reg <=(7'b1100110); 
            'd5: out_reg <=(7'b1101101); 
            'd6: out_reg <=(7'b1111101); 
            'd7: out_reg <=(7'b0000111); 
            'd8: out_reg <=(7'b1111111); 
            'd9: out_reg <=(7'b1101111);
            default: out_reg <= (7'b0000000);  
        endcase
    end
end

assign segments = (ACTIVE_HIGH) ? out_reg : ~out_reg;
assign digit_valid = (bcd_digit<='d9 && enable) ? 1'b1: 1'b0;
endmodule