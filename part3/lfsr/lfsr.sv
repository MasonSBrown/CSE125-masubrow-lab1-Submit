module lfsr
   (input [0:0] clk_i
   ,input [0:0] reset_i
   ,input [0:0] en_i
   ,output [10:0] data_o);

   wire [0:0] feedback;

   xor2 feedback_gate
     (.a_i(data_o[1]) ,.b_i(data_o[10])  ,.c_o(feedback));

   shift #(.depth_p(11), .reset_val_p(11'b00000000001)) state_register
     (.clk_i(clk_i) ,.reset_i(reset_i)  ,.enable_i(en_i) ,.data_i(feedback)  ,.data_o(data_o));

endmodule
