module Universal_Shift_Register (
  input wire clk,        // Clock input
  input wire reset,      // Reset input
  input wire load,       // Load input
  input wire shift_left, // Shift left input
  input wire shift_right, // Shift right input
  input wire serial_in,  // Serial input
  input wire enable,     // Enable input
  output wire [3:0] q    // 4-bit output
);

// your implementation here
reg [3:0] q_reg;

always_ff @(posedge clk) begin
  if(reset) begin
    q_reg <= 4'b0;
  end
  else begin
    if(load) q_reg <= {q_reg[6:0],serial_in};
    else if(enable) begin
      if(shift_left) q_reg <= {q_reg[2:0],q_reg[3]};
      else if(shift_right) q_reg <= {q_reg[0],q_reg[3:1]};
    end
  end
end

assign q = q_reg;

endmodule
