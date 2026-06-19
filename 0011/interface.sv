module odd_counter (
  input     wire        clk,
  input     wire        reset,

  output    reg [7:0]  cnt_o
);

// your implementation here
always_ff @(posedge clk or posedge reset) begin
  if(reset) cnt_o <= 8'd1;
  else cnt_o <= cnt_o + 8'd2;
end
endmodule