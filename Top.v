module top(
  input start_top,clk_top,reset_top,
  input [9:0] in1,in2,
  output [9:0] res_top
);
  
  wire [1:0] sub_AB_sig,A_gr_sig;
  wire finish_sig;
  
  dp dp_inst(
    .clk(clk_top),
    .start(start_top),
    .finish(finish_sig),
    .sub_AB(sub_AB_sig),
    .A(in1),
    .B(in2),
    .A_gr(A_gr_sig),
    .res(res_top)
  );
  
  fsm fsm_inst(
    .clk(clk_top),
    .reset(reset_top),
    .start(start_top),
    .A_gr(A_gr_sig),
    .sub_AB(sub_AB_sig),
    .finish(finish_sig)
  );
  
endmodule