module sync_fifo #(
  parameter DEPTH   = 4,
  parameter DATA_W  = 1
)(
  input         wire              clk,
  input         wire              reset,

  input         wire              push_i,
  input         wire[DATA_W-1:0]  push_data_i,

  input         wire              pop_i,
  output        wire[DATA_W-1:0]  pop_data_o,

  output        wire              full_o,
  output        wire              empty_o
);

// your implementation here
reg [DATA_W-1:0] mem [DEPTH-1:0];
reg [$clog2(DEPTH)-1:0] rd_ptr;
reg [$clog2(DEPTH)-1:0] wr_ptr;
reg [$clog2(DEPTH):0]cnt;

reg [DATA_W-1:0] pop_reg;

always_ff @(posedge clk or posedge reset) begin
  if(reset) begin
    // mem <= {DEPTH{'b0}};
    rd_ptr <= 'b0;
    wr_ptr <= 'b0;
    cnt <= 'b0;
    pop_reg <= 'b0;
  end
  else begin
    if(push_i && !full_o) begin
      mem[wr_ptr] <= push_data_i;
      wr_ptr <= wr_ptr + 1'b1;
      // cnt <= cnt + 1'b1;
    end
    if(pop_i && !empty_o) begin
      // pop_reg <= mem[rd_ptr];
      rd_ptr <= rd_ptr + 1'b1;
      // cnt <= cnt - 1'b1;
    end

    cnt <= cnt + (push_i && !full_o) - (pop_i && !empty_o);
    // if(push_i && pop_i && !full_o && !empty_o) begin
      // cnt <= cnt;
    // end
  end
end

assign pop_data_o = mem[rd_ptr];
assign full_o = (cnt == DEPTH); 
assign empty_o = (cnt == 0);

endmodule