module priority_arbiter #(
  parameter NUM_PORTS = 4
)(
    input       wire[NUM_PORTS-1:0] req_i,
    output      wire[NUM_PORTS-1:0] gnt_o   // One-hot grant signal
);

// your implementation here
genvar i;
generate
  for (i= 0;i < NUM_PORTS; i++) begin
    if(i==0) assign gnt_o[i] = req_i[i];
    else begin
      assign gnt_o [i] = req_i[i] & ~|req_i[i-1:0];
    end
  end
endgenerate 
endmodule