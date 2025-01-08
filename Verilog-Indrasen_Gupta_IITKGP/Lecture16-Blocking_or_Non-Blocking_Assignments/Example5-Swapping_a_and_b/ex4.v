module swap(input reg a, b);
    always @(posedge clk)
        begin
            ta = a;
            tb = b;
            a = tb;
            b = ta;
        end
endmodule

/***
-> correct swapping will occur but we will be needing two temporary variables ta and tb 
***/