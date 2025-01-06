module use_wor(input a, b, c, d, output f);

    wor f;

    assign f = a & b;
    assign f = c | d;

endmodule