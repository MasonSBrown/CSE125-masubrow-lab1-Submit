module xnor2
  (input [0:0] a_i
  ,input [0:0] b_i
  ,output [0:0] c_o);

   // For Lab 1, do not use assign statements!
   // Your code here:
   wire [0:0] different;


  xor2 xor_gate (.a_i(a_i), .b_i(b_i),  .c_o(different));
  nand2 invert_gate (.a_i(different), .b_i(different), .c_o(c_o));


endmodule
