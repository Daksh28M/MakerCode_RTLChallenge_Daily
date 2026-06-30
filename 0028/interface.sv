module serial_in_parallel_out (
    input wire clock,          // Clock input
    input wire reset,          // Reset input
    input wire serial_in,     // Serial input
    output wire [7:0] parallel_out // Parallel output
);

// your implementation here
reg [7:0] sipo_mem;

always_ff @(posedge clock) begin
    if(reset) begin
        sipo_mem <= 8'b0;
    end
    else begin
        sipo_mem <= {sipo_mem[6:0],serial_in};
    end
end

assign parallel_out = sipo_mem;

endmodule
