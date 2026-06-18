module simple_alu (
  input     wire [7:0]   a_i,
  input     wire [7:0]   b_i,
  input     wire [2:0]   op_i,

  output    reg [7:0]    alu_o
);

// your implementation here
localparam ADD=0, SUB=1, AND=2, OR=3, XOR=4, NOT=5, SLL=6, SRL=7;

always @(*) begin
  case(op_i)
    ADD: alu_o <= a_i + b_i;
    SUB: alu_o <= a_i - b_i;
    AND: alu_o <= a_i & b_i;
    OR:  alu_o <= a_i | b_i;
    XOR: alu_o <= a_i ^ b_i;
    NOT: alu_o <= ~a_i;
    SLL: alu_o <= a_i << 1;
    SRL: alu_o <= a_i >> 1;
  endcase
end
endmodule