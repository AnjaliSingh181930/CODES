module multiple_clk(clk, a, b, c, f1, f2);

    input clk, a, b, c;
    output reg f1, f2;

    always @(posedge clk)
        f1 <= a & b;

    always @(negedge clk)
        f2 <= b ^ c;

endmodule

