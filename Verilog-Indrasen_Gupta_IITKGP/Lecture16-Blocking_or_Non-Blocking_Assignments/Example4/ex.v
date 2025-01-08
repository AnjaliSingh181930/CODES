module non_blocking_assgn();
    reg clk = 0;
    integer a, b, c, d;
    
    // Generate the clock signal (periodic)
    always begin
        #5 clk = ~clk; // Toggle clk every 5 time units
    end

    always @ (posedge clk) //all assignments take place at the rising edge of the clock
        begin
            a <= b & c;
            d <= a ^ d;
            c <= a | b;
        end

    initial 
    begin
       
        $monitor ( $time, "  a = %4d, b = %4d, c = %4d, d = %4d", a, b, c, d);
        a = 30;
        b = 20;
        c =15;
        d = 5;
        #200 $finish;
    end
endmodule