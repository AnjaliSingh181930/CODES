module testbench;
    // Declare the signal to connect to the output of the count module
    integer count;

    // Instantiate the count module
    count uut ();

    // Apply the initial block to run the simulation
    initial begin
        // Display a header message
        $display("Starting simulation...");

        // Initialize the waveform dump for GTKWave
        $dumpfile("count.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);
        
        // Run the simulation for a specific time period
        #100;  // Let the simulation run for 100 time units
        
        // End the simulation
        $finish;
    end
endmodule
