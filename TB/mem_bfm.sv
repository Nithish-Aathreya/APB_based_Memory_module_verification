class mem_bfm;
    mem_tx tx;

    virtual mintf vif;

    function new();
        vif=top.pintf;
    endfunction

    task run();
        forever begin
            common::g2b.get(tx);
            drive(tx);
            common::bfm_count++;
            //$display("bfm_count = %0d",common::bfm_count);
        end
    endtask

    task drive(mem_tx tx);
    @(vif.bfm_cb);
    //$display("%0t - 1st block @bfm",$time);
     vif.bfm_cb.valid <= 1;
     vif.bfm_cb.wr_rd <= tx.wr_rd;
     vif.bfm_cb.addr <= tx.addr;
    if(tx.wr_rd ==1 ) begin
        //$display("%0t - wr_rd ==1 @bfm 1st block",$time);
         vif.bfm_cb.wdata <= tx.wdata;
    end
        else begin
        //$display("%0t - wr_rd ==0 @bfm 1st block",$time);
        vif.bfm_cb.wdata <= 0;
    end

    wait(vif.bfm_cb.ready == 1);

    @(vif.bfm_cb );
    //$display("%0t - 2nd block @bfm",$time);
    if(tx.wr_rd ==1) begin
        //$display("%0t - wr_rd ==1 @bfm 2nd block",$time);
        tx.rdata = 0;
    end
    else begin
        //$display("%0t - wr_rd ==0 @bfm 2nd block",$time);
        tx.rdata = vif.bfm_cb.rdata;
        tx.wdata =0;
    end

    vif.bfm_cb.valid <= 0;
    vif.bfm_cb.wr_rd <= 0;
    vif.bfm_cb.addr <= 0;
    vif.bfm_cb.wdata <= 0;

    endtask


endclass
