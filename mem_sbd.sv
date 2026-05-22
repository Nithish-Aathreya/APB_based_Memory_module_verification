class mem_sbd;
    mem_tx tx;
    int arr [int];
    int i=0;

    task run();
        forever begin
            //while(i<=common::bfm_count) begin
              //i++;
            tx=new();
            common::m2s.get(tx);
            if(tx.wr_rd) begin
                i++;
                arr[tx.addr] = tx.wdata;
                if(common::count==i) begin
                  foreach(arr[j])
                  $display("arr[%0h]=%0h",j,arr[j]);
          end
          end
            else begin
                if(tx.rdata == arr[tx.addr]) begin
                    common::match++;
                    //$display("match=%0d",common::match);
                end
                else begin
                    common::mis_match++;
                    //$display("mis_match=%0d",common::mis_match);
                end
            end
            //end
        //    foreach(arr[i])
          //  $display("arr[%0d]=%0h",i,arr[i]);
        end
    endtask
endclass
                

