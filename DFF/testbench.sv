 import uvm_pkg::*;
`include "uvm_macros.svh"

 //Include all files
`include "dff_transaction.sv"
`include "dff_sequence.sv"
`include "dff_sequencer.sv"
`include "dff_driver"

module DFF_TB;
  
  dff_if tb_dif();
  
  DFF DUT(.dif(tb_dif));
  

  initial
    begin
      #100;
      $finish;
    end
  
    initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
endmodule