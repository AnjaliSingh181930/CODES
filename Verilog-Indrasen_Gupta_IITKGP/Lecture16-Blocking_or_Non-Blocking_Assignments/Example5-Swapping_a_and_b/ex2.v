module swap(input reg a, b);
    always @(posedge clk)
        a <= b;
    
    always @(posedge clk)
        b <= a;
endmodule

/***
-> here the variables are correctly swapped
-> all rhs variables are read first , and assigned to lhs variables at the positive edge of the clock
***/