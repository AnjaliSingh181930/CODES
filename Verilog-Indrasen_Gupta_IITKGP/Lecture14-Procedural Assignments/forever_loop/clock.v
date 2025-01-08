module clock;
    reg clock;

    // Generate clock signal
    initial begin
        clock = 0;
        forever
            #5 clock = ~clock;  // Toggle the clock every 5 time units
    end

    // Display the clock's value whenever it changes
    initial begin
        $monitor("Clock is: %b", clock);  // Monitor and display the clock value
    end
endmodule
