// This module implements a INV gate
module inv
  (input [0:0] x_i
  ,output [0:0] y_o);

   assign y_o = ~x_i;

endmodule
	   
