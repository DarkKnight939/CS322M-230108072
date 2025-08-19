`timescale 1ns / 1ps
module master_fsm(
    input  wire clk_sig,
    input  wire rst_n,
    input  wire ack_in,
    output reg  req_out,
    output reg  [7:0] data_bus,
    output reg  finished
);

    localparam ST_IDLE       = 3'b000,
               ST_SEND       = 3'b001,
               ST_WAIT_ACK   = 3'b010,
               ST_WAIT_LOW   = 3'b011,
               ST_DONE       = 3'b100;

    reg [2:0] cur_st, next_st;
    reg [1:0] byte_cnt, byte_cnt_next;

    always @(posedge clk_sig) begin
        if (rst_n) begin
            cur_st   <= ST_IDLE;
            byte_cnt <= 2'b00;
        end else begin
            cur_st   <= next_st;
            byte_cnt <= byte_cnt_next;
        end
    end

    always @(*) begin
        next_st       = cur_st;
        byte_cnt_next = byte_cnt;
        req_out       = 1'b0;
        data_bus      = 8'hZZ;
        finished      = 1'b0;

        case (cur_st)
            ST_IDLE: next_st = ST_SEND;

            ST_SEND: begin
                req_out  = 1'b1;
                data_bus = 8'hA0 + byte_cnt;
                next_st  = ST_WAIT_ACK;
            end

            ST_WAIT_ACK: begin
                data_bus = 8'hA0 + byte_cnt;
                if (ack_in) begin
                    next_st  = ST_WAIT_LOW;
                    req_out  = 1'b0;
                end
            end

            ST_WAIT_LOW: begin
                if (!ack_in) begin
                    if (byte_cnt == 2'd3) next_st = ST_DONE;
                    else begin
                        next_st       = ST_SEND;
                        byte_cnt_next = byte_cnt + 1;
                    end
                end
            end

            ST_DONE: begin
                finished = 1'b1;
                next_st  = ST_IDLE;
            end
        endcase
    end

endmodule
