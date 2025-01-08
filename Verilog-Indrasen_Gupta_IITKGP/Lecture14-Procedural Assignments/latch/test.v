module testbench;

    // Declare inputs and outputs for the latch module
    reg Din, enable;
    wire Q, Qbar;

    // Instantiate the latch module (unit under test)
    latch uut (
        .Din(Din),
        .enable(enable),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Apply test vectors
    initial begin
        // Initialize inputs
        Din = 0;
        enable = 0;
        
        // Display header
        $display("Time | Din | Enable | Q | Qbar");

        // Test case 1: enable = 0 (Q should not change)
        #10 Din = 1; enable = 0; // Q should remain at 0
        #10 Din = 0; enable = 0; // Q should remain at 0
        #10 Din = 1; enable = 0; // Q should remain at 0

        // Test case 2: enable = 1 (Q should follow Din)
        #10 Din = 1; enable = 1; // Q should be 1
        #10 Din = 0; enable = 1; // Q should be 0
        #10 Din = 1; enable = 1; // Q should be 1

        // Test case 3: Test changing `enable` while Din is constant
        #10 Din = 1; enable = 0; // Q should remain 1
        #10 Din = 0; enable = 1; // Q should change to 0
        #10 Din = 0; enable = 0; // Q should remain 0

        // End the simulation
        $finish;
    end

    // Display changes in Q and Qbar
    always @ (Q, Qbar) begin
        $display("%0t | %b | %b | %b | %b", $time, Din, enable, Q, Qbar);
    end

endmodule

