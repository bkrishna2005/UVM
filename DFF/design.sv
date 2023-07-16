interface dff_if;
  logic Q;
  logic D;
  logic clk;
  logic rst_n;
endinterface

module DFF ( dff_if dif );
  always@(posedge dif.clk or negedge dif.rst_n)
    begin
      if (dif.rst_n==0)
        dif.Q <= 0;
      else
        dif.Q <= dif.D;
    end
  
endmodule