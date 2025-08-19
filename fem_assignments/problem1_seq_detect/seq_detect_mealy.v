`timescale 1ns / 1ps

module seq_detect_mealy(
    input  din,
    input  clk,
    input  rst,
    output y
    );    
    reg [1:0] current_state, next_state;
    parameter S0 = 2'd0,  // no match
              S1 = 2'd1,  // '1'
              S2 = 2'd2,  // "11"
              S3 = 2'd3;  // "110"
    
    always @(posedge clk)        
    begin
        if (rst)                    
            current_state <= S0;
        else
            current_state <= next_state;  
    end    
    always @(*)                   
    begin
        case (current_state)
            S0: if (!(din)) next_state = S0; else next_state = S1;
        
            S1: if (!(din)) next_state = S0; else next_state = S2;
                    
            S2: if (!(din)) next_state = S3; else next_state = S2;
                    
            S3: if (!(din)) next_state = S0; else next_state = S1;
       
            default: next_state = S0; 
        endcase
    end
    assign y = (current_state == S3) & din; 
endmodule
