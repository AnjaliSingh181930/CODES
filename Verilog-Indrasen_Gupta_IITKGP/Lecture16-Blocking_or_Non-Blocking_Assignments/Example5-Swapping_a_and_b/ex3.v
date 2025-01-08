module swap(input reg a, b);
    always @(posedge clk)
        begin
            a = b;
            b = a;
        end
endmodule

/***
-> both a nad b will be getting the values previously stored in b
***/