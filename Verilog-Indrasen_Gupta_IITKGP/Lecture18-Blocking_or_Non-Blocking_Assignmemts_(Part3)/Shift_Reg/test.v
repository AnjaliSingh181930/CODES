module testbench;

    // Declare signals for the DUT (Design Under Test)
    reg clock, clear, A;
    wire E;

    // Instantiate the shiftreg_4bit module (DUT)
    shiftreg_4bit uut (
        .clock(clock),
        .clear(clear),
        .A(A),
        .E(E)
    );

    // Clock generation
    always #5 clock = ~clock;  // Toggle clock every 5 time units

    // Stimulus process
    initial begin
        // Initialize signals
        clock = 0;
        clear = 1;  // Initially clear is high (no clear)
        A = 0;      // Initialize A to 0

        // Apply stimulus
        #10 A = 1;         // Apply A = 1 at time 10
        #50 A = 0;         // Apply A = 0 at time 60
        #60 A = 1;         // Apply A = 1 at time 100
        #60 A = 0;         // Apply A = 0 at time 40
        #60 clear = 0;     // Trigger clear at time 50
        #60 clear = 1;     // Release clear at time 60

        // Continue applying stimuli after clear is released
        #360 A = 1;         // Apply A = 1 at time 80
        #420 A = 0;         // Apply A = 0 at time 100

        #500 $finish;        // End simulation at time 150
    end

    // Monitor the output
    initial begin
        $monitor("At time %t: A = %b, E = %b, clear = %b", $time, A, E, clear);
    end

endmodule
