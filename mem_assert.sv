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







endmodule

