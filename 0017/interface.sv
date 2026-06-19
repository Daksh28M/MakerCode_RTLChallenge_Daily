module parallel_to_serial (
  input     wire      clk,
  input     wire      reset,

  output    wire      empty_o,
  input     wire[3:0] parallel_i,

  output    wire      serial_o,
  output    wire      valid_o
);

reg [3:0] piso;
reg [2:0] cnt;
reg busy;

// your implementation here
always_ff @(posedge clk or posedge reset) begin
  if(reset) begin
    piso <= 4'd0;
    cnt <= 3'd0;
    busy <= 1'b0;
  end
  else begin
    if(!busy) begin
      piso <= parallel_i;
      cnt <= 3'd0;
      busy <= 1'd1;
    end
    else if(busy) begin 
      piso = piso >> 1;
      cnt <= cnt + 3'd1;
      if(cnt == 3) busy <= 1'd0;
    end
  end
end

assign empty_o = !busy;
assign valid_o = busy;
assign serial_o = piso[0]; 
endmodule