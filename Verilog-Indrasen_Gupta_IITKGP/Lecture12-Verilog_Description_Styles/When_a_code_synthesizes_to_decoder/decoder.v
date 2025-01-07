module generate_decoder (out, in, select);

    input in ;
    input [1:0] select;     // 2-bit select signal
    output [3:0] out;       // 4-bit output

    assign out[select] = in;
    //Non-constant index in expression on LHS generates a decoder.

endmodule


