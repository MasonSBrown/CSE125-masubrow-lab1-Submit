module mux2
  (input [0:0] a_i
  ,input [0:0] b_i
  ,input [0:0] select_i
  ,output [0:0] c_o);

   // For Lab 1, do not use assign statements!
   // Your code here:
   wire [0:0] select_n, a_n, b_n;

  nand2 invert_select (.a_i(select_i), .b_i(select_i), .c_o(select_n));
  nand2 select_a (.a_i(a_i), .b_i(select_n), .c_o(a_n));
  nand2 select_b (.a_i(b_i), .b_i(select_i), .c_o(b_n));
  nand2 result_gate (.a_i(a_n), .b_i(b_n), .c_o(c_o));

endmodule
