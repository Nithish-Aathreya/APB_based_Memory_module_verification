class mem_cov;
    mem_tx tx;

    covergroup mem_cg;
        ADDRESS_COVERAGE:coverpoint tx.addr{
           option.auto_bin_max=7; 
            }
        WR_RD_TOGGLE:coverpoint tx.wr_rd{
            bins WRITE = {1};
            bins READ = {0};
            }
        cross ADDRESS_COVERAGE,WR_RD_TOGGLE;

    endgroup

    function new();
        mem_cg = new();
    endfunction

    task run();
        forever begin
            common::m2c.get(tx);
            mem_cg.sample();
    end
endtask
endclass
