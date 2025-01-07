module testbench;
    reg S, R;        // Set and Reset inputs
    wire Q, Qbar;    // Outputs Q and Qbar

    // Instantiate the SR Latch
    sr_latch uut (
        .S(S),
        .R(R),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Test sequence
    initial begin
        // Display the outputs
        $monitor("Time = %0t | S = %b, R = %b | Q = %b, Qbar = %b", $time, S, R, Q, Qbar);

        // Invalid state: S = 1, R = 1 (should not happen in SR latch)
        #5 S = 1; R = 1;
        
        // Set the latch: S = 1, R = 0
        #5 S = 1; R = 0;
        
        // Reset the latch: S = 0, R = 1
        #5 S = 0; R = 1;
        
        // Invalid state: S = 1, R = 1 (should not happen in SR latch)
        #5 S = 1; R = 1;

        // Set the latch: S = 1, R = 0
        #5 S = 1; R = 0;

        // Invalid state: S = 1, R = 1 (should not happen in SR latch)
        #5 S = 1; R = 1;
        
        // Hold the latch: S = 0, R = 0
        #5 S = 0; R = 0;

        // End the simulation
        #5 $finish;
    end
endmodule
