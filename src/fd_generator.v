module fd_generator # (parameter DW=512)
(
    input           clk, resetn,

    input           start,

    output[DW-1:0]  axis_tdata,
    output reg      axis_tvalid,
    input           axis_tready
);

reg[2:0] cycle_counter;
reg[15:0] data;

assign axis_tdata = {32{data}};

reg[1:0] fsm_state;
always @(posedge clk) begin

    cycle_counter <= cycle_counter + 1;

    if (resetn == 0) begin
        fsm_state     <= 0;
        cycle_counter <= 0;
        axis_tvalid   <= 0;
    end else case(fsm_state)

    0:  if (start) begin
            data        <= 0;
            axis_tvalid <= 1;
            fsm_state   <= fsm_state + 1;
        end
    
    1:  if (axis_tvalid & axis_tready) begin
            if (cycle_counter < 2) begin
                axis_tvalid <= 0;
                fsm_state   <= fsm_state + 1;
            end 

            else data       <= data + 1;
        end

    2:  if (cycle_counter >= 2) begin
            data        <= data + 1;
            axis_tvalid <= 1;
            fsm_state   <= fsm_state - 1;
        end

    endcase



end


endmodule