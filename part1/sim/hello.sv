module hello
  /* verilator lint_off UNUSEDSIGNAL */
  (input clk_i
  ,input reset_i);
  /* verilator lint_on UNUSEDSIGNAL */

   initial
     $display("Hello World!");

endmodule
