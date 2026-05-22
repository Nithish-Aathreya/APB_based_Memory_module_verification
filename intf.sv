interface mintf(input logic clk,rst);
logic wr_rd,valid;
logic [`ADDR_W-1:0] addr;
logic [`WIDTH-1:0] wdata;
logic [`WIDTH-1:0]rdata;
logic ready;

clocking bfm_cb @(posedge clk);

default  input #0 output #1;

output wr_rd;
output valid;
output addr;
output wdata;
input rdata;
input ready;

endclocking

endinterface
