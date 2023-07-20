class dff_monitor extends uvm_monitor;
  `uvm_component_utils(dff_monitor)
  
  virtual dff_if vif;
  
  uvm_analysis_port#(dff_transaction) ap;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
    ap = new("ap", this);
  endfunction

  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual dff_if)::get(this, "", "vif", vif)) begin
      `uvm_error("build_phase", "No virtual interface specified for this monitor instance")
    end
  endfunction

   virtual task run_phase(uvm_phase phase);
     super.run_phase(phase);
     @(posedge this.vif.clk);
     forever 
       begin
         dff_transaction tr;
         tr = dff_transaction::type_id::create("tr", this);
         tr.D = this.vif.D;
         @(posedge this.vif.clk);
         tr.Q = this.vif.Q;
         ap.write(tr);
       end
   endtask
  
endclass