`timescale 1ns / 1ps
module link_top(
    input  wire clk_sig,
    input  wire rst_n,
    output wire finished
);

    wire req_sig, ack_sig;
    wire [7:0] data_bus;

    master_fsm u_master (
        .clk_sig(clk_sig),
        .rst_n(rst_n),
        .ack_in(ack_sig),
        .req_out(req_sig),
        .data_bus(data_bus),
        .finished(finished)
    );

    slave_fsm u_slave (
        .clk_sig(clk_sig),
        .rst_n(rst_n),
        .req_in(req_sig),
        .data_bus_in(data_bus),
        .ack_out(ack_sig),
        .last_data()
    );

endmodule
