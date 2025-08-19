`timescale 1ns / 1ps
module slave_fsm(
    input  wire clk_sig,
    input  wire rst_n,
    input  wire req_in,
    input  wire [7:0] data_bus_in,
    output reg  ack_out,
    output reg  [7:0] last_data
);

    localparam ST_IDLE   = 2'b00,
               ST_ACK1   = 2'b01,
               ST_ACK2   = 2'b10,
               ST_WAIT   = 2'b11;

    reg [1:0] cur_st, next_st;

    always @(posedge clk_sig) begin
        if (rst_n) begin
            cur_st   <= ST_IDLE;
            last_data <= 8'b0;
        end else begin
            cur_st <= next_st;
            if (cur_st == ST_IDLE && req_in) begin
                last_data <= data_bus_in;
            end
        end
    end

    always @(*) begin
        next_st = cur_st;
        ack_out = 1'b0;

        case (cur_st)
            ST_IDLE: if (req_in) next_st = ST_ACK1;

            ST_ACK1: begin
                ack_out = 1'b1;
                next_st = ST_ACK2;
            end

            ST_ACK2: begin
                ack_out = 1'b1;
                next_st = ST_WAIT;
            end

            ST_WAIT: begin
                if (!req_in) next_st = ST_IDLE;
            end
        endcase
    end
endmodule
