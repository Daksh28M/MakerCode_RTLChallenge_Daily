module lfsr (
  input     wire      clk,
  input     wire      reset,

  output    wire[3:0] lfsr_o
);

// your implementation here
reg [3:0] lfsr_reg;

always_ff @(posedge clk or posedge reset) begin
  if(reset) lfsr_reg<= 4'b1110;
  else lfsr_reg <= {lfsr_reg[2:0],lfsr_reg[3]^lfsr_reg[1]};
end

assign lfsr_o = lfsr_reg;
endmodule