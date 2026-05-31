module memory_assert(clk,rst,wr_rd,addr,wdata,rdata,valid,ready);
input clk,rst,wr_rd,valid;
input [`ADDR_W-1:0] addr;
input [`WIDTH-1:0] wdata;
input [`WIDTH-1:0]rdata;
input ready;


property timeperiod;
 time t;
@(posedge clk)(1,t=$time) |=>(($time-t)==`TP);
endproperty
cover property(timeperiod);
assert property(timeperiod);

property handshake;
    @(posedge clk) (valid==1) |=>(ready==1);
endproperty
cover property(handshake);
assert property(handshake);

//wdata should be valid data
property wdata_valid;
    @(posedge clk) (wr_rd==1) |->not ( $isunknown(wdata));
endproperty
assert property(wdata_valid);
cover property(wdata_valid);

//rdata should be valid data
property rdata_valid;
    @(posedge clk) (wr_rd==0) |=>not ( $isunknown(rdata));
endproperty
assert property(rdata_valid);
cover property(rdata_valid);

//addr should be valid data
property addr_valid;
    @(posedge clk) (wr_rd==1) |->not ( $isunknown(addr));
endproperty
assert property(addr_valid);
cover property(addr_valid);

endmodule

