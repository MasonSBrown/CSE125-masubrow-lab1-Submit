module xor2
  (input [0:0] a_i
  ,input [0:0] b_i
  ,output [0:0] c_o);

   // For Lab 1, do not use assign statements!
   // Your code here:
  wire [0:0] ab_n, a_n, b_n;

  nand2 ab (.a_i(a_i),  .b_i(b_i), .c_o(ab_n));
  nand2 a_gate (.a_i(a_i), .b_i(ab_n), .c_o(a_n));
  nand2 b_gate (.a_i(b_i), .b_i(ab_n),  .c_o(b_n));
  nand2 result_gate (.a_i(a_n), .b_i(b_n), .c_o(c_o));


endmodule
