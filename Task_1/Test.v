`include "Arch.v"

module one_bit;
    reg A, B;
    wire o1, o2, o3;

    comparator uut (
        .A(A),
        .B(B),
        .o1(o1),
        .o2(o2),
        .o3(o3)
    );

    initial begin
        $dumpfile("runnable.vcd");
        $dumpvars(0, one_bit);
        $display("1-bit Comparator");
        $monitor("%b %b | %b %b %b", A, B, o1, o2, o3);
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $finish;
    end
endmodule
