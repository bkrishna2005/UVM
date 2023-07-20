class dff_agent extends uvm_agent;
  `uvm_component_utils(dff_agent)
  
  dff_sequencer sqr;
  dff_driver    drv;
  dff_monitor   mon;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
   virtual function void build_phase(uvm_phase phase);
      sqr = dff_sequencer::type_id::create("sqr", this);
      drv = dff_driver::type_id::create("drv", this);
      mon = dff_monitor::type_id::create("mon", this);
   endfunction

   //Connect - driver and sequencer port to export
   virtual function void connect_phase(uvm_phase phase);
      drv.seq_item_port.connect(sqr.seq_item_export);
   endfunction
  
endclass