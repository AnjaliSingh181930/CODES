module blocking_assgn;
    integer a, b, c, d;
    always @ (*) 
        repeat (4)
        begin
            #5 a = b + c;
            #5 d = a - 3;
            #5 b = d + 10;
            #5 c = c + 1;
        end
endmodule