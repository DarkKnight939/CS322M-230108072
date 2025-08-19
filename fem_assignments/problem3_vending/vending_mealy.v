`timescale 1ns / 1ps
module vending_mealy(
    input  wire clk_sig,
    input  wire reset,
    input  wire [1:0] coin_in,
    output wire item_out,
    output wire return5
);
    reg [1:0] st_cur, st_nxt;

    parameter S_IDLE  = 2'd0,  
              S_5     = 2'd1,  
              S_10    = 2'd2,  
              S_15    = 2'd3;  

    always @(posedge clk_sig) begin
        if (reset)
            st_cur <= S_IDLE;
        else
            st_cur <= st_nxt; 
    end

    always @(*) begin
        case (st_cur)
            S_IDLE: begin
                if (coin_in == 2'b00)
                    st_nxt = S_IDLE;
                else if (coin_in == 2'b01)
                    st_nxt = S_5;
                else
                    st_nxt = S_10;
            end
            S_5: begin
                if (coin_in == 2'b00)
                    st_nxt = S_IDLE;
                else if (coin_in == 2'b01)
                    st_nxt = S_10;
                else
                    st_nxt = S_15;
            end
            S_10: begin
                if (coin_in == 2'b00)
                    st_nxt = S_IDLE;
                else if (coin_in == 2'b01)
                    st_nxt = S_15;
                else
                    st_nxt = S_IDLE;
            end
            S_15: begin
                st_nxt = S_IDLE;
            end
        endcase
    end

    assign item_out = ( (st_cur == S_10  && coin_in == 2'b10) || 
                        (st_cur == S_15 && coin_in == 2'b01) || 
                        (st_cur == S_15 && coin_in == 2'b10) );

    assign return5 = (st_cur == S_15 && coin_in == 2'b10);

endmodule
