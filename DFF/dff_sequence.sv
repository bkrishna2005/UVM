class dff_sequence extends uvm_sequence#(dff_transaction);
  `uvm_object_utils(dff_sequence)
  
  function new(string name="");
    super.new(name);
  endfunction
  
  task body();
    dff_transaction dff_trans;
    repeat(10);
    begin
      dff_trans = new();
      start_item(dff_trans);
      finish_item(dff_trans);
    end
  endtask
endclass