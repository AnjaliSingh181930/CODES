module testbench;

    // Inputs to the generate_decoder
    reg in;                 // Single-bit input
    reg [1:0] select;       // 2-bit select signal
    
    // Output from the generate_decoder
    wire [3:0] out;         // 4-bit output
    
    // Instantiate the generate_decoder module
    generate_decoder uut (
        .out(out),
        .in(in),
        .select(select)
    );

    // Initial block for testing the module
    initial begin
        // Display the test results in the console
        $monitor($time, " select=%b, in=%b, out=%b", select, in, out);

        // Initialize the waveform dump for GTKWave
        $dumpfile("decoder.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);

        // Test case 1: select = 00, in = 1
        #5  in = 1; select = 2'b00;
        
        // Test case 2: select = 01, in = 1
        #5  in = 1; select = 2'b01;
        
        // Test case 3: select = 10, in = 1
        #5  in = 1; select = 2'b10;
        
        // Test case 4: select = 11, in = 1
        #5  in = 1; select = 2'b11;
        
        // Test case 5: select = 00, in = 0 (reset all outputs to 0)
        #5  in = 0; select = 2'b00;
        
        // Test case 6: select = 01, in = 0
        #5  in = 0; select = 2'b01;
        
        // Test case 7: select = 10, in = 0
        #5  in = 0; select = 2'b10;
        
        // Test case 8: select = 11, in = 0
        #5  in = 0; select = 2'b11;
        
        // Finish the simulation after the tests
        #5  $finish;
    end

endmodule
