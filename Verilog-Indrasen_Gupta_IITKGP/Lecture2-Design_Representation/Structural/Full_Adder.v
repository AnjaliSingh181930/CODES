// Through Boolean Expression
module full_adder (A, B, C, S, Cy);
    input A, B, C;
    output S, Cy;
    sum S1 (A, B, Cy, C);
    carry C1 (A, B, C, Cy);
endmodule

// Through Truth Table
primitive carry_cy(Cy, A, B, C);
    input A, B, C;
    output Cy;

    table
        // A B C : Cy
         1 1 ? : 1; // Carry is 1 when at least two inputs are 1
         1 ? 1 : 1;
         ? 1 1 : 1;
         0 0 ? : 0; // Carry is 0 when fewer than two inputs are 1
         0 ? 0 : 0;
         ? 0 0 : 0;
    endtable

endprimitive

