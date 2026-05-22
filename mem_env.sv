class mem_env;

    mem_agent agt = new();
    mem_sbd sbd = new();

    task run();
        fork
            //$display("\t\tRun task in environment is running\n");
            agt.run();
            sbd.run();
    join_none
    endtask
endclass
