module counter
  #(parameter width_p = 4)
   (input [0:0] clk_i
   ,input [0:0] reset_i
   ,input [0:0] up_i
   ,input [0:0] down_i
   ,output [width_p-1:0] count_o);

   wire [0:0] count_enable, unused_carry;
   wire [width_p-1:0] next_count;
   // count when one direction selected
   xor2 enable_gate (.a_i(up_i) ,.b_i(down_i) ,.c_o(count_enable));


   // 00 01 inc, 11 dec
   adder #(.width_p(width_p)) step_adder
     (.a_i(count_o) ,.b_i({{(width_p-1){down_i}}, 1'b1})  ,.sum_o({unused_carry, next_count}));

   for (genvar i = 0; i < width_p; i++) begin : gen_bit
      dff state_bit (.clk_i(clk_i) ,.reset_i(reset_i) ,.en_i(count_enable)  ,.d_i(next_count[i]) ,.q_o(count_o[i]));
   end



endmodule
