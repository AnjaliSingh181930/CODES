module four_bit_adder(
    input [3:0] A, B,
    input C,
    output [3:0] S,
    output Cy
);

    wire [2:0] c_out; // gives the interconnection

    //instantiation: means we are using 4 copies of full adder
    full_adder FD1(A[0], B[0], C, S[0], c_out[0]);
    full_adder FD2(A[1], B[1], c_out[0], S[1], c_out[1]);
    full_adder FD3(A[2], B[2], c_out[1], S[2], c_out[2]);
    full_adder FD4(A[3], B[3], c_out[2], S[3], Cy);

endmodule