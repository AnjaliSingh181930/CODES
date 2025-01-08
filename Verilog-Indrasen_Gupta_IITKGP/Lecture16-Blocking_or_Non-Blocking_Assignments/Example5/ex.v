module non_blocking_assgn();
    reg clk = 0;
    integer a, b, c, d;

    always @ (posedge clk) //all assignments take place at the rising edge of the clock
        begin
            a <= b + c;
            d <= a - 3;
            c <= d + 10;
            c <= c + 1;
        end

    initial 
        begin
        
            $monitor ( $time, "  a = %4d, b = %4d, c = %4d, d = %4d", a, b, c, d);
            a = 30;
            b = 20;
            c =15;
            d = 5;

            forever #5 clk = ~clk;
            
        end

    initial 
        #100 $finish;
endmodule