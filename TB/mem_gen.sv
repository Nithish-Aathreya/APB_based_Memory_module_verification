class mem_gen;
mem_tx tx;
integer q[$];
integer a;


    task run();
    case(common::testcase)
    "wr_rd": begin
        repeat(common::count) begin
            tx=new();
         assert(tx.randomize() with {tx.wr_rd==1;});
         q.push_back(tx.addr);
         common::g2b.put(tx);
         end
        repeat(common::count) begin
         tx=new();
         a = q.pop_front();   
         assert(tx.randomize() with {tx.wr_rd==0;tx.addr==a;});
         //$display("a=%0h",a);
         common::g2b.put(tx);
         end
    end
    endcase
    endtask
endclass
