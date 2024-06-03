module configure
(
    output[31:0] FRAME_SIZE,
    output[63:0] FD0_RING_ADDR, FD1_RING_ADDR, FD_RING_SIZE,
    output[63:0] MD0_RING_ADDR, MD1_RING_ADDR, MD_RING_SIZE,
    output[63:0] FC_ADDR
);

assign FRAME_SIZE = 32'h1_0000;

assign FD0_RING_ADDR = 32'h1000_0000;
assign FD1_RING_ADDR = 32'h2000_0000;
assign FD_RING_SIZE  = 32'h0004_0000;

assign MD0_RING_ADDR = 32'h3000_0000;
assign MD1_RING_ADDR = 32'h4000_0000;
assign MD_RING_SIZE  = 32'h0000_1000;

assign FC_ADDR  = 64'hAABBCCDD_11223344;

endmodule