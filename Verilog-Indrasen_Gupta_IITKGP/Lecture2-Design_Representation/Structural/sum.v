module sum(A, B, C, S);
    input A, B, C;
    output S;

    wire sum;

    xor x1(A, B, sum);
    xor x2(sum, C, S);

endmodule