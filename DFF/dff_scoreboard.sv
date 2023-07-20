class dff_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(dff_scoreboard)
  
  uvm_analysis_imp#(dff_transaction, dff_scoreboard) mon_export;
  dff_transaction exp_queue[$];

  function new(string name, uvm_component parent);
    super.new(name,parent);
    mon_export = new("mon_export", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  function void write(dff_transaction tr);
    exp_queue.push_back(tr);
  endfunction 
  
  virtual task run_phase(uvm_phase phase);
    dff_transaction expdata;
    
    forever 
    begin
      wait(exp_queue.size() > 0);
      expdata = exp_queue.pop_front();
      
      if(expdata.D == expdata.Q) 
        begin
          `uvm_info("DFF_SCOREBOARD",$sformatf("------ :: DATA Match :: ------"),UVM_LOW)
          `uvm_info("",$sformatf("D: %0h",expdata.D),UVM_LOW)
          `uvm_info("",$sformatf("Expected Data: %0h Actual Data: %0h",expdata.D,expdata.Q),UVM_LOW)
        end
        else begin
          `uvm_error("DFF_SCOREBOARD","------ :: READ DATA MisMatch :: ------")
          `uvm_info("",$sformatf("D: %0h",expdata.D),UVM_LOW)
          `uvm_info("",$sformatf("Expected Data: %0h Actual Data: %0h",expdata.D,expdata.Q),UVM_LOW)
        end
    end
  endtask 
  
endclass