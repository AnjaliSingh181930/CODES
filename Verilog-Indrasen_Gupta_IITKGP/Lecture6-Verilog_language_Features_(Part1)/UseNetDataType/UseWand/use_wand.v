module use_wand(input A, B, C, D, output F);

    wand F;

    assign F = A & B;
    assign F = C | D;

endmodule


//use_wand.v:1: syntax error
//use_wand.v:1: Errors in port declarations.