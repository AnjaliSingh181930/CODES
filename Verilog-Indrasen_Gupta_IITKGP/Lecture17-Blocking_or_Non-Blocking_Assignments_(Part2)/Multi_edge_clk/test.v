module testbench;

    // Declare signals for the module
    reg clk, a, b, c;
    wire f1, f2;

    // Instantiate the design under test (DUT)
    multiple_clk uut (
        .clk(clk),
        .a(a), 
        .b(b), 
        .c(c), 
        .f1(f1), 
        .f2(f2)
    );

    // Clock generation for clk1 and clk2
    always #5 clk = ~clk;  // Toggle clk1 every 5 time units
    

    // Stimulus process (test vectors)
    initial begin
        // Initialize signals
        clk = 0;
        a = 0;
        b = 0;
        c = 0;

        // Apply test vectors
        #10 a = 1; b = 1; c = 0;  // Apply values at time 10
        #10 a = 1; b = 0; c = 1;  // Apply values at time 20
        #20 a = 0; b = 1; c = 1;  // Apply values at time 40
        #30 $finish;  // End simulation at time 70
    end

    // Monitor outputs
    initial begin
        $monitor("At time %t: clk = %b, f1 = %b, f2 = %b", $time, clk, f1, f2);
    end

endmodule
