module d_flip_flop (
  input     wire      clk,
  input     wire      reset,

  input     wire      d_i, // D input to the flop

  output    reg       q_norst_o, // Q output from non-resettable flop
  output    reg       q_syncrst_o, // Q output from flop using synchronous reset
  output    reg       q_asyncrst_o // Q output from flop using asynchrnoous reset
);

// your implementation here
always @(posedge clk) begin //sync
  if(reset) q_syncrst_o <= 0;
  else q_syncrst_o <= d_i;
end

always @(posedge clk or posedge reset) begin //async
  if(reset) q_asyncrst_o <= 0;
  else q_asyncrst_o <= d_i;
end

always @(posedge clk) begin //non-resettable
  q_norst_o <= d_i;
end

endmodule