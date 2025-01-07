module add(X, Y, Z, Cin, sign, carry, parity, zero, overflow);
    input [3:0] X, Y;
    input Cin;
    output [3:0] Z;
    output sign, carry, parity, zero, overflow;

    wire p0, p1, p2, p3, g0, g1, g2, g3, c1, c2, c3;

    assign g0 = X[0] & Y[0];
    assign p0 = X[0] ^ Y[0];
    
    assign g1 = X[1] & Y[1];
    assign p1 = X[1] ^ Y[1];

    assign g2 = X[2] & Y[2];
    assign p2 = X[2] ^ Y[2];

    assign g3 = X[3] & Y[3];
    assign p3 = X[3] ^ Y[3];

    assign Z[0] = p0 ^ Cin;

    assign c1 = g0 | (Cin & p0);
    assign Z[1] = p1 ^ c1;

    assign c2 = g1 | (g0 & p1) | (Cin & p0 & p1);
    assign Z[2] = p2 ^ c2;

    assign c3 = g2 | (g1 & p2) | (g0 & p1 & p2) | (Cin & p0 & p1 & p2);
    assign Z[3] = p3 ^ c3;

    assign carry = g3 | (g2 & p3) | (g1 & p2 & p3) | (g0 & p1 & p2 & p3) | (Cin & p0 & p1 & p2 & p3);

    assign sign = Z[3];
    assign parity = ~^Z;
    assign zero = ~|Z;
    assign overflow = (X[3] & Y[3] & ~Z[3]) || (~X[3] & ~Y[3] & Z[3]);

endmodule