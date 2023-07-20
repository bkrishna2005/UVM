class dff_env extends uvm_env;
  `uvm_component_utils(dff_env)
  dff_agent agnt;
  dff_scoreboard scb;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agnt = dff_agent::type_id::create("agnt",this);
    scb  = dff_scoreboard::type_id::create("scb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agnt.mon.ap.connect(scb.mon_export);
  endfunction
  
endclass