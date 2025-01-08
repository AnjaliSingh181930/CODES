module swap(input reg a, b);
    always @(posedge clk)
        a = b;
    
    always @(posedge clk)
        b = a;
endmodule

/***
-> either a = b will execute before b = a, or vice versa, depending on simulator implementation.
-> both registers will get the same value either a or b.
    @ race condition
***/