module mux2to1(in, sel, out);
    input [1:0] in;
    input sel;
    output out;
    wire t1, t2, t3;

    not     G1 (t1, sel);
    and     G2 (t2, in[0], t1);
    and     G3 (t3, in[1], sel);
    or      G4 (out, t1, t3);

    // assign t1 = ~sel;           // NOT gate
    // assign t2 = in[0] & t1;     // AND gate
    // assign t3 = in[1] & sel;    // AND gate
    // assign out = t2 | t3;       // OR gate
  
endmodule