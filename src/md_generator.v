module md_generator # (parameter DW=512)
(
    input           clk, resetn,

    input           start,

    output[DW-1:0]  axis_tdata,
    output reg      axis_tvalid,
    input           axis_tready
);

reg[7:0] data;

assign axis_tdata = {64{data}};

reg fsm_state;
always @(posedge clk) begin

    if (resetn == 0) begin
        fsm_state     <= 0;
        axis_tvalid   <= 0;
    end else case(fsm_state)

    0:  if (start) begin
            data        <= 1;
            axis_tvalid <= 1;
            fsm_state   <= 1;
        end
    
    1:  if (axis_tvalid & axis_tready) begin
            data <= data + 1;
        end

    endcase



end


endmodule