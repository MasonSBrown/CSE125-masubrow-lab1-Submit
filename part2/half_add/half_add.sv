module half_add
  (input [0:0] a_i
  ,input [0:0] b_i
  ,output [0:0] carry_o
  ,output [0:0] sum_o);

   // For Lab 1, do not use assign statements!
   // Your code here:
  wire [0:0] carry_n;

  xor2 sum_gate (.a_i(a_i), .b_i(b_i),  .c_o(sum_o));
  nand2 carry_gate (.a_i(a_i),  .b_i(b_i), .c_o(carry_n));
  nand2 invert_carry (.a_i(carry_n), .b_i(carry_n), .c_o(carry_o));


endmodule
