`timescale 1ns / 1ps
module tb_vending_mealy();
    reg clk;
    reg reset;
    reg [1:0] coin_in;
    wire item_out;
    wire return5;

    vending_mealy dut (
        .clk_sig(clk),
        .reset(reset),
        .coin_in(coin_in),
        .item_out(item_out),
        .return5(return5)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_vending_mealy);

        reset = 1; coin_in = 2'b00;
        #20;
        reset = 0;

        @(posedge clk); coin_in = 2'b01;
        @(posedge clk); coin_in = 2'b01;
        @(posedge clk); coin_in = 2'b10;
        @(posedge clk); coin_in = 2'b00;
        repeat(2) @(posedge clk); coin_in = 2'b10;
        @(posedge clk); coin_in = 2'b10;
        @(posedge clk); coin_in = 2'b01;
        @(posedge clk); coin_in = 2'b00;
        repeat(2) @(posedge clk); coin_in = 2'b01;
        @(posedge clk); coin_in = 2'b00;
        @(posedge clk); coin_in = 2'b10;
        @(posedge clk); coin_in = 2'b01;
        @(posedge clk); coin_in = 2'b10;

        #50;
        $finish;
    end
endmodule
