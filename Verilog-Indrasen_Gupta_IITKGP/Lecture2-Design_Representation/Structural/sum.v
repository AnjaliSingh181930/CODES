module sum(A, B, C, S);
    input A, B, C;
    output S;

    wire sum;

    xor x1(sum, A, B);
    xor x2(S, C, sum);

endmodule