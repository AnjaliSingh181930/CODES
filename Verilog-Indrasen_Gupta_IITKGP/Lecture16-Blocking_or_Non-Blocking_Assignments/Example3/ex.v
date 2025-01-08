module non_blocking_assgn();
    integer a, b, c, d;
    always @ (*) 
        repeat (4)
        begin
             a <= #5 b + c;
             d <= #5 a - 3;
             b <= #5 d + 10;
        end

    initial 
        begin
        
            $monitor ( $time, "  a = %4d, b = %4d, c = %4d, d = %4d", a, b, c, d);
            a = 30;
            b = 20;
            c =15;
            d = 5;
            #100 $finish;
        end
endmodule