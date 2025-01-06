module use_wire(input a, b, c, d, output f);

    wire f;

    assign f = a & b;
    assign f = c | d;

endmodule