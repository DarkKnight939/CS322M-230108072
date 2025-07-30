`include "Arch.v" 

module tb_equality_comparator;
    reg [3:0] A, B;
    wire equal;

    equality_comparator uut (
        .A(A),
        .B(B),
        .equal(equal)
    );

    initial begin
        $dumpfile("runnable.vcd");
        $dumpvars(0, tb_equality_comparator); 

        $display("A B | Equal");
        $monitor("%b %b | %b", A, B, equal);

        A = 4'b0000; B = 4'b0000; #10;
        A = 4'b1010; B = 4'b1010; #10;
        A = 4'b1100; B = 4'b1110; #10;
        A = 4'b0111; B = 4'b0110; #10;
        A = 4'b1111; B = 4'b1111; #10;

        $finish;
    end
endmodule
