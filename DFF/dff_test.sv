class dff_test extends uvm_test;
  `uvm_component_utils(dff_test)
  dff_env env;
  
  function new(string name, uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    env = dff_env::type_id::create("env", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    dff_sequence seq;
    seq = dff_sequence::type_id::create("seq", this);
    phase.raise_objection(this);
    $display("%t Starting sequence dff_seq run_phase",$time);
    seq.start(env.agnt.sqr);
    #100ns;
    phase.drop_objection(this);
  endtask
              
endclass