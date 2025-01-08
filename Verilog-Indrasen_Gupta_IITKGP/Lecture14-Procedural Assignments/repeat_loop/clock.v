module clock;
    reg clock;
    initial begin 
        clock = 0;
        repeat(10)
            begin
            #5 clock = ~clock;
            $display("Clock is: %d", clock);
            end
    end
endmodule