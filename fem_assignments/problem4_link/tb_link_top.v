`timescale 1ns / 1ps
module tb_link_top;
    parameter CLK_PERIOD = 10;
    reg clk_sig, rst_n;
    wire finished;

    link_top dut (.clk_sig(clk_sig), .rst_n(rst_n), .finished(finished));

    initial begin
        clk_sig = 0;
        forever #(CLK_PERIOD / 2) clk_sig = ~clk_sig;
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_link_top);

        rst_n = 1;
        repeat(2) @(posedge clk_sig);
        rst_n = 0;

        wait (finished);
        @(posedge clk_sig);
        $display("4-byte transfer complete at time %0t ns.", $time);
        $finish;
    end
endmodule
