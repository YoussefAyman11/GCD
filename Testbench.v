`timescale 1ns/1ps
module tb;
  parameter clk_period = 10ns;
  reg clk = 0;
  always #(clk_period/2) clk = ~ clk;
  
  reg start_tb,reset_tb;
  reg [9:0] A_tb,B_tb;
  wire [9:0] res_tb;
  wire Done_tb;
  
  top dut(
    .start_top(start_tb),
    .clk_top(clk),
    .reset_top(reset_tb),
    .in1(A_tb),
    .in2(B_tb),
    .res_top(res_tb)
  );
  
  
  task test(
    input [9:0] input1,input2
  );

    A_tb = input1;
    B_tb = input2;
    start_tb = 1;
    #(clk_period)
    start_tb = 0;
    
    while(res_tb == 0)
      #(clk_period);
    $display("The output is : %d",res_tb);
  endtask

  initial begin
    reset_tb = 1;
    #(clk_period)
    reset_tb = 0;
    
    test(10,5);
    test(7,21);
    test(0,10);
    test(3,17);
    test(5,0);
    test(20,6);
    $finish();
  end
    
endmodule