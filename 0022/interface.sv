module stopwatch_timer (
    input  wire        clk,
    input  wire        reset,
    input  wire        start,
    input  wire        clear,
    output wire [5:0]  minutes,
    output wire [5:0]  seconds,
    output wire [3:0]  tenths,
    output wire        running
);
// your implementation here
reg [3:0] base_count;   //0 - 10
reg [3:0] tenth_count;  //0 - 10
reg [5:0] second_count; //0 - 59
reg [5:0] minute_count; //0 - 59
reg running_state;

always @(posedge clk or posedge reset) begin
    if(reset || clear) begin
        base_count <= 1'b0;
        tenth_count <= 4'd0;
        second_count <= 6'd0;
        minute_count <= 6'd0;
        if(!clear) running_state <= 1'b0;
    end

    else if(start) begin
        // base_count <= (base_count == 4'd9) ? 4'd0 : (base_count + 1'd1);
        // if(base_count == 4'd9) tenth_count <= (tenth_count == 4'd9) ? 4'd0 : (tenth_count + 1'd1);
        // if(tenth_count == 4'd9) second_count <= (second_count == 6'd59) ? 6'd0 : (second_count + 1'd1);
        // if(second_count == 6'd59) minute_count <= (minute_count == 6'd59) ? 6'd0 : (minute_count + 1'd1);
        // running_state <= 1'b1;

        if(base_count == 4'd9) begin
            base_count <= 4'b0;
            if(tenth_count == 4'd9) begin
                tenth_count <= 4'd0;
                if(second_count == 6'd59) begin
                    second_count <= 6'd0;
                    if(minute_count == 6'd59) begin
                        minute_count <= 6'd0;
                    end else begin
                        minute_count <= minute_count + 'd1;
                    end 
                end else begin
                    second_count <= second_count + 'd1;
                end
            end else begin
                tenth_count <= tenth_count + 'd1;
            end
        end else begin
            base_count <= base_count + 'd1;
        end

        running_state <= 1'b1;

    end
    
    else begin
        base_count <= base_count;
        tenth_count <= tenth_count;
        second_count <= second_count;
        minute_count <= minute_count;
        running_state <= 1'b0;
    end
end

assign tenths = tenth_count;
assign seconds = second_count;
assign minutes = minute_count;

assign running = running_state;

endmodule