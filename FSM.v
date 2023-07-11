module fsm(
  input clk,reset,start,
  input [1:0] A_gr,
  output reg [1:0] sub_AB,
  output reg finish
);
    
  parameter [1:0] start_st = 2'b00,
				  equal = 2'b01,
    			  greater = 2'b10,
    			  result = 2'b11;
    
  reg [1:0] curr_state,next_state;
    
  always @(posedge clk) begin
    if(reset)
      curr_state = start_st;
    else
      curr_state = next_state;
  end
    
  always @(*) begin
    finish = 0;
	sub_AB = 0;
    case(curr_state)
      start_st: begin
        if(!start)
          next_state = start_st;
        else
          next_state = equal;
      end
      
      equal: begin
        if(A_gr == 1)
          next_state = result;
        else if(A_gr == 0)
          next_state = equal;
        else
          next_state = greater;
      end
      
      greater: begin
        if(A_gr == 2)
          sub_AB = 1;
        else if(A_gr == 3)
          sub_AB = 2;
        next_state = equal;
      end
      
      result: begin
        finish = 1;
        next_state = start;
      end
    endcase
  end
endmodule