module adder
  #(parameter width_p = 5)
  // You must fill in the bit widths of a_i, b_i and sum_o. a_i and
  // b_i must be width_p bits.
  (input [width_p-1:0] a_i
  ,input [width_p-1:0] b_i
  ,output [width_p:0] sum_o);

   // Your code here
   if (width_p == 1) begin : gen_single
      half_add first (.a_i(a_i[0]),  .b_i(b_i[0]), .sum_o(sum_o[0]), .carry_o(sum_o[1]));
   end else begin : gen_multiple
      //each stages carry separate
      for (genvar i = 0; i < width_p-1; i++) begin : gen_bit
         wire [0:0] carry;
         if (i > 0) begin : gen_middle
            full_add middle (.a_i(a_i[i]), .b_i(b_i[i]), .carry_i(gen_bit[i-1].carry), .sum_o(sum_o[i]), .carry_o(carry));
         end
      end


      half_add first (.a_i(a_i[0]), .b_i(b_i[0]), .sum_o(sum_o[0]), .carry_o(gen_bit[0].carry));
      full_add last (.a_i(a_i[width_p-1]), .b_i(b_i[width_p-1]), .carry_i(gen_bit[width_p-2].carry), .sum_o(sum_o[width_p-1]), .carry_o(sum_o[width_p]));
   end



endmodule
