module multiple_clk(clk1, clk2, a, b, c, f1, f2);

    input clk1, clk2, a, b, c;
    output reg f1, f2;

    always @(posedge clk1)
        f1 <= a & b;

    always @(negedge clk2)
        f2 <= b ^ c;

endmodule

