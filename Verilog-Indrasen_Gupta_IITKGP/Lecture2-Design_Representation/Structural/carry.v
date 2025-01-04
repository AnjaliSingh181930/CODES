module carry(A, B, C, Cy);

    input A, B, C;
    output Cy;

    wire t1, t2, t3;

    and a1(t1, A, B);
    and a2(t2, B, C);
    and a3(t3, A, C);

    or o1(Cy, t1, t2, t3);

endmodule