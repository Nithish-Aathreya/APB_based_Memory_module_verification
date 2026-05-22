`define WIDTH 16 
`define DEPTH 128 
`define ADDR_W $clog2(`DEPTH) 
`define TP 10 

module memory(clk,rst,wr_rd,addr,wdata,rdata,valid,ready);
input clk,rst,wr_rd,valid;
input [`ADDR_W-1:0] addr;
input [`WIDTH-1:0] wdata;
output reg [`WIDTH-1:0]rdata;
output reg ready;

reg [`WIDTH-1:0] mem [`DEPTH-1:0];

always@(posedge clk) begin

    if(rst) begin
rdata<=0;
ready<=0;
foreach(mem[i])
    mem[i]<=0;
    end

    else begin
    if(valid) begin
        ready =1;
        if(wr_rd) begin
            mem[addr] <= wdata;
            //$display("%0t [design] - taking inside",$time);
        end
        else begin
            rdata <= mem[addr]; 
            //$display("%0t [design] - giving out",$time);
        end

    end
    else
        ready =0;
    end
end
endmodule

