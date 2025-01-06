module testbench;

    reg rst, clock;  
    wire [7:0] count;  // 7-bit wire to match the output of the counter module

    // Instantiate the counter module
    counter #(.N(7)) DUT(rst, clock, count);

    initial begin
        // Initialize the waveform dump for GTKWave
        $dumpfile("counter.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);

        // Monitor the values of inputs and outputs
        $monitor($time, " rst = %b, clock = %b, count = %b", rst, clock, count);

        // Apply test cases
        #5 rst = 0; clock = 1; // Test case 1
        #5 rst = 1; clock = 1; // Test case 2
        #5 rst = 0; clock = 0; // Test case 3
        #5 rst = 0; clock = 1; // Test case 4
        #5 rst = 1; clock = 0; // Test case 5

        // Finish the simulation
        $finish;
    end
endmodule