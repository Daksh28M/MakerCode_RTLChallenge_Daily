module shift_register(
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,      // Serial input

  output    wire[3:0]   sr_o
);

reg [3:0] sipo;
// your implementation here
always_ff @(posedge clk or posedge reset) begin
  if(reset) sipo = 4'd0;
  else sipo = {sipo[2:0],x_i};
end

assign sr_o = sipo;
endmodule