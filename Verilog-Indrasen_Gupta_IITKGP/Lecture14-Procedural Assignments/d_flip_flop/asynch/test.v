module testbench;

    // Declare inputs and outputs for the dff module
    reg D, clock, set, reset;
    wire Q, Qbar;

    // Instantiate the D flip-flop (dff module)
    dff uut (
        .D(D),
        .clock(clock),
        .set(set),
        .reset(reset),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Generate the clock signal
    initial begin
        clock = 0;
        forever #5 clock = ~clock;  // Toggle clock every 5 time units
    end

    // Apply test vectors
    initial begin
        // Initialize inputs
        D = 0;
        set = 1;
        reset = 1;

        // Display header
        $display("Time | D | Set | Reset | Q | Qbar");

        // Test case 1: Normal operation with D = 1, set and reset are high
        #10 D = 1; set = 1; reset = 1; // Should set Q = 1
        #10 D = 0; set = 1; reset = 1; // Should reset Q = 0
        #10 D = 1; set = 1; reset = 1; // Should set Q = 1
        #10 D = 0; set = 0; reset = 1; // Should set Q = 1 because set = 0
        #10 D = 1; set = 1; reset = 0; // Should reset Q = 0 because reset = 0
        #10 D = 1; set = 1; reset = 1; // Should set Q = 1

        // End the simulation
        $finish;
    end

    // Display changes in Q and Qbar
    always @ (Q, Qbar) begin
        $display("%0t | %b | %b | %b | %b | %b", $time, D, set, reset, Q, Qbar);
    end

endmodule
