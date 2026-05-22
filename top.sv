module top;
reg clk, rst ;
real cov;
mintf pintf(clk,rst);

mem_env env = new();

initial begin
    clk=0;
    forever #5 clk = ~clk;
end

initial begin
    rst=1;
    reset();
    @(posedge clk);
    rst=0;
    env.run();
end

task reset();
pintf.wr_rd=0;
pintf.valid=0;
pintf.addr=0;
pintf.wdata=0;
endtask

memory dut (
    .clk(pintf.clk),
    .rst(pintf.rst),
    .wr_rd(pintf.wr_rd),
    .addr(pintf.addr),
    .wdata(pintf.wdata),
    .rdata(pintf.rdata),
    .valid(pintf.valid),
    .ready(pintf.ready)
    );


memory_assert ass_dut (
    .clk(pintf.clk),
    .rst(pintf.rst),
    .wr_rd(pintf.wr_rd),
    .addr(pintf.addr),
    .wdata(pintf.wdata),
    .rdata(pintf.rdata),
    .valid(pintf.valid),
    .ready(pintf.ready)
    );

    initial begin
    #200;
    wait(common::count*2==common::bfm_count);
    $display("-------------------------------- ");
    $display("\t SCOREBOARD DATA");
    $display("\t Testcase=%0s",common::testcase);
    $display("Number of packets generated=%0d",common::count);
    $display("\t bfm packets driven=%0d",common::bfm_count);
    if(common::match!=0 && common::mis_match==0)
        $display("\t Testcases passed");
    else
        $display("\t Testcase failed");
    #100;
    cov=$get_coverage();
    $display("Coverage = %0f",cov);
    $finish;
    
    end



endmodule
