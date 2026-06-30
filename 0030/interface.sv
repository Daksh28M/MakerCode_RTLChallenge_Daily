module lifo (
  input wire clk,            // Clock signal
  input wire reset,          // Reset signal
  input wire push,           // Push data into the queue
  input wire pop,            // Pop data from the queue
  input wire [7:0] data_in,  // Data to be pushed into the queue
  output wire [7:0] data_out // Data popped from the queue
);

// your implementation here
reg [7:0] stack [3:0];
reg [2:0] stk_ptr;
reg empty;
reg full;
reg [7:0] out;

always_ff @(posedge clk or posedge reset) begin
  if(reset) begin
    stk_ptr <= 3'b00;
    empty <= 1'b1;
    full <= 1'b0;
    out <= 8'b0;
    for(int i=0;i<3;i++) begin
      stack[i] <= 8'b0;
    end 
  end
  else begin
    if(push && !full) begin
      
      stack[stk_ptr] <= data_in;
      stk_ptr <= stk_ptr + 1;
    end
    else if(pop && !empty) begin
      out <= stack[stk_ptr-1];
      stack[stk_ptr-1] <= 8'b0;
      stk_ptr <= stk_ptr - 1'b1;
    end
  end
  if(empty) out <= 8'b00;
end

always @(*) begin
  if(stk_ptr == 3'd4) full = 1'b1;
  else full = 1'b0;

  if(stk_ptr == 3'd0) empty = 1'b1;
  else empty = 1'b0;
end

assign data_out = out;
endmodule