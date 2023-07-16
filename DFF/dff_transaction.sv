class dff_transaction extends uvm_sequence_item;
  `uvm_object_utils(dff_transaction)
  
  rand logic D;
  
  function new (string name = "dff_transaction");
    super.new(name);
  endfunction
  
endclass