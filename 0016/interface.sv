module self_reload_counter (
  input     wire          clk,
  input     wire          reset,
  input     wire          load_i,
  input     wire[3:0]     load_val_i,

  output    wire[3:0]     count_o
);

reg  [4:0] count_reg;

// your implementation here
always_ff @(posedge clk or posedge reset) begin
  if(reset) count_reg <= 4'd0;
  else begin
    if(load_i || count_reg == 4'hF) count_reg <= load_val_i;
    else count_reg <= count_reg + 'd1;
  end
end

assign count_o = count_reg;
endmodule