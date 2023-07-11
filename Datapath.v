module dp(
  input clk,start,finish,
  input [1:0] sub_AB,
  input [9:0] A,B,
  output reg [1:0] A_gr,
  output reg [9:0] res
);
  
  reg [9:0] x,y;
  
  always @(posedge clk) begin
    res <=0;
    if(start) begin
      x = A;
      y = B;
      A_gr = 0;
      if(x == 0 || y == 0) res<= (x > y) ? x : y;
    end
    else if(x == y) begin
      A_gr = 1;
    end
    
    else if(x > y) begin
      A_gr = 2;
    end
    
    else begin
      A_gr = 3;
    end
    
    if(sub_AB == 1) begin
      x = x - y;
    end
    
    else if(sub_AB == 2) begin
      y = y - x;
    end
    
    if(finish)
      res <= x;
  end
endmodule