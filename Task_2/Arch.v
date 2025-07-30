module equality_comparator (
    input  [3:0] A,
    input  [3:0] B,
    output       equal
);
    assign equal = ~| (A ^ B);
endmodule
