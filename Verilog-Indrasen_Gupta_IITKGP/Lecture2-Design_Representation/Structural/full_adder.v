// Through Boolean Expression
module full_adder (A, B, C, S, Cy);
    input A, B, C;
    output S, Cy;
    sum S1 (A, B, C, S);
    carry C1 (A, B, C, Cy);
endmodule

