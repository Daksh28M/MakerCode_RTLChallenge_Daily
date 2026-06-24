module round_robin_arbiter (
  input     wire        clk,
  input     wire        reset,
  input     wire[3:0]   req_i,
  output    reg[3:0]    gnt_o
);

// your implementation here

reg [1:0] last_gnt;
reg [3:0] gnt_tmp;

always @(posedge clk) begin
  if(reset) begin
    last_gnt = 2'd3;  //to start first cycle with 0 bit as highest priority
    gnt_o = 4'b0;
    gnt_tmp = 4'b0;
  end
  else begin
    gnt_o <= gnt_tmp;

    if( |(gnt_tmp) ) begin //atleast one grant given
      last_gnt = (gnt_tmp[0]) ? 2'd0 : 
                 (gnt_tmp[1]) ? 2'd1 :
                 (gnt_tmp[2]) ? 2'd2 : 2'd3;
    end
  end
end

always @(*) begin
  case(last_gnt)
    2'd0: begin
           if(req_i[1]) gnt_tmp = 4'b0010 ;
      else if(req_i[2]) gnt_tmp = 4'b0100 ;
      else if(req_i[3]) gnt_tmp = 4'b1000 ;
      else if(req_i[0]) gnt_tmp = 4'b0001 ;
      else gnt_tmp = 4'b0;
    end
    2'd1: begin
           if(req_i[2]) gnt_tmp = 4'b0100 ;
      else if(req_i[3]) gnt_tmp = 4'b1000 ;
      else if(req_i[0]) gnt_tmp = 4'b0001 ;
      else if(req_i[1]) gnt_tmp = 4'b0010 ;
      else gnt_tmp = 4'b0;
    end
    2'd2: begin
           if(req_i[3]) gnt_tmp = 4'b1000 ;
      else if(req_i[0]) gnt_tmp = 4'b0001 ;
      else if(req_i[1]) gnt_tmp = 4'b0010 ;
      else if(req_i[2]) gnt_tmp = 4'b0100 ;
      else gnt_tmp = 4'b0;
    end
    2'd3: begin
           if(req_i[0]) gnt_tmp = 4'b0001 ;
      else if(req_i[1]) gnt_tmp = 4'b0010 ;
      else if(req_i[2]) gnt_tmp = 4'b0100 ;
      else if(req_i[3]) gnt_tmp = 4'b1000 ;
      else gnt_tmp = 4'b0;
    end
  endcase
end
endmodule