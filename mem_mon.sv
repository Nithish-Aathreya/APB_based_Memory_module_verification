class mem_mon;
    mem_tx tx;

    virtual mintf vif;    
    function new();
        vif = top.pintf;
    endfunction

    task run();
    forever begin
       @(posedge vif.clk);
       //$display("%0t - before condition monitor",$time);
       if(vif.valid ==1 && vif.ready==1) begin
       //$display("%0t - after condition monitor",$time);
           tx=new();
           tx.wr_rd = vif.wr_rd;
           tx.addr = vif.addr;
           if(tx.wr_rd)
               tx.wdata = vif.wdata;
           else
               tx.rdata = vif.rdata;

           common::m2c.put(tx);
           common::m2s.put(tx);
       end
    end
    endtask
endclass

