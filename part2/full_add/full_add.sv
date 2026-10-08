module full_add
  (input [0:0] a_i
  ,input [0:0] b_i
  ,input [0:0] carry_i
  ,output [0:0] carry_o
  ,output [0:0] sum_o);

   // For Lab 1, do not use assign statements!
   // Your code here:
  wire [0:0] partial_sum, carry_ab, carry_in;
  wire [0:0] carry_ab_n, carry_in_n;

  half_add add_ab
    (.a_i(a_i), .b_i(b_i), .sum_o(partial_sum), .carry_o(carry_ab));

  half_add add_carry
    (.a_i(partial_sum), .b_i(carry_i), .sum_o(sum_o), .carry_o(carry_in));

  nand2 invert_ab
    (.a_i(carry_ab), .b_i(carry_ab), .c_o(carry_ab_n));

  nand2 invert_in
    (.a_i(carry_in), .b_i(carry_in), .c_o(carry_in_n));

  nand2 combine_carry
    (.a_i(carry_ab_n), .b_i(carry_in_n), .c_o(carry_o));

endmodule
