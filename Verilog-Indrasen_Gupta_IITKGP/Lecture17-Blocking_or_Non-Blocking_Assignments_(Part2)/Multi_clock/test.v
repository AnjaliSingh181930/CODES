module testbench;

    // Declare signals for the module
    reg clk1, clk2, a, b, c;
    wire f1, f2;

    // Instantiate the design under test (DUT)
    multiple_clk uut (
        .clk1(clk1), 
        .clk2(clk2), 
        .a(a), 
        .b(b), 
        .c(c), 
        .f1(f1), 
        .f2(f2)
    );

    // Clock generation for clk1 and clk2
    always #5 clk1 = ~clk1;  // Toggle clk1 every 5 time units
    always #4 clk2 = ~clk2;  // Toggle clk2 every 4 time units

    // Stimulus process (test vectors)
    initial begin
        // Initialize signals
        clk1 = 0;
        clk2 = 0;
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

        // Initialize the waveform dump for GTKWave
        $dumpfile("clk.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);

        $monitor("At time %t: clk1 = %b, f1 = %b, clk2 = %b, f2 = %b", $time, clk1, f1, clk2, f2);
    end

endmodule
